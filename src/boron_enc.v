module boron_enc (
    input  clk, rst, start, [63:0] plain_text, [79:0] master_key,  
    output reg done, reg [63:0] cipher_text 
);


    parameter IDLE = 3'b000, ROUND = 3'b001, FINAL = 3'b010;

    reg [2:0] reg_sm_main = 3'b0;
    reg [4:0] reg_round_counter = 5'b0;

    reg [63:0] reg_plaintext;
    wire [63:0] reg_nextplaintext;
    reg [79:0] reg_key;
    wire [79:0] reg_nextkey;

    key_scheduler ks(.clk(clk), .rst(rst), .round_counter(reg_round_counter), .i_ks_oldkey(reg_key), .o_ks_newkey(reg_nextkey));
    add_round_key ark(.i_ark_msg(reg_plaintext), .i_ark_key(reg_key[63:0]), .o_ark_cipher(reg_nextplaintext));

    //wire [63:0] last_result;
    //assign last_result = reg_nextkey ^ reg_nextplaintext;
    always @(posedge clk ) begin
        case (reg_sm_main)
            IDLE: //idle
                if(start) begin
                   reg_plaintext <= plain_text; 
                    reg_key <= master_key;
                   reg_sm_main <= ROUND;
                end
                else
                    reg_sm_main <= IDLE;
                
            ROUND:

                if(reg_round_counter < 25) begin
                   reg_plaintext <= reg_nextplaintext;
                   reg_key <= reg_nextkey;
                    reg_sm_main <= ROUND;
                end
                else if(reg_round_counter == 25)
                    reg_sm_main <= FINAL;

            FINAL: 
            begin
                
                cipher_text <=(reg_nextkey[63:0] ^ reg_nextplaintext);
                done <= 1'b1;
            end


                 
            default: 
                reg_sm_main <= IDLE;
        endcase
    end

    always @(negedge clk ) begin
        if(!rst) begin
            reg_round_counter <= 0;
        end
        else if(reg_sm_main == ROUND) begin
            reg_round_counter <= reg_round_counter + 1;
        end
    end

    
endmodule