module boron_dec (
    input  clk, rst, start, [63:0] plain_text, [79:0] master_key,  
    output reg done, reg [63:0] cipher_text 
);


    parameter IDLE = 3'b000, KEYGEN = 3'b011, ROUND = 3'b001, FINAL = 3'b010;

    reg [2:0] reg_sm_main = 3'b0;
    reg [4:0] reg_round_counter = 5'd0;

    reg [63:0] reg_plaintext;
    wire [63:0] reg_nextplaintext;
    reg [79:0] reg_key;
    wire [79:0] reg_nextkey, dec_reg_nextkey;

    key_scheduler ks(.clk(clk), .rst(rst), .round_counter(reg_round_counter), .i_ks_oldkey(reg_key), .o_ks_newkey(reg_nextkey));
    dec_key_scheduler dks(.clk(clk), .rst(rst), .round_counter(reg_round_counter), .i_ks_oldkey(reg_key), .o_ks_newkey(dec_reg_nextkey));
    dec_add_round_key ark(.i_ark_cipher(reg_plaintext), .i_ark_key(dec_reg_nextkey[63:0]), .o_ark_msg(reg_nextplaintext));

    //wire [63:0] last_result;
    //assign last_result = reg_nextkey ^ reg_nextplaintext;
    always @(negedge clk ) begin
        case (reg_sm_main)
            IDLE: //idle
                if(start) begin
                   reg_plaintext <= plain_text; 
                    reg_key <= master_key;
                   reg_sm_main <= KEYGEN;
                   reg_round_counter <= 5'b0;
                end
                else
                    reg_sm_main <= IDLE;
            KEYGEN:
                if(reg_round_counter < 25) begin
                    reg_key <= reg_nextkey;
                   reg_sm_main <= KEYGEN;
                                    
                end else begin
                    reg_sm_main <= ROUND;
                    reg_round_counter <= 5'd26;
                    reg_plaintext <=(reg_nextkey ^ plain_text);
                    reg_key <= reg_nextkey;
                end
            ROUND:
                if(reg_round_counter > 0) begin
                   reg_plaintext <= reg_nextplaintext;
                   reg_key <= dec_reg_nextkey;
                    reg_sm_main <= ROUND;
                end
                else if(reg_round_counter == 0) begin
                    
                //reg_plaintext <= reg_nextplaintext;
                  // reg_key <= dec_reg_nextkey;
                    reg_sm_main <= FINAL;
                end

            FINAL: 
            begin
                
                
                done <= 1'b1;
            end
                 
            default: 
                reg_sm_main <= IDLE;
        endcase
    end

    always @(posedge clk ) begin
        if(!rst ) begin
            reg_round_counter <= 5'd50;
        end
        else if(reg_sm_main == KEYGEN)
            reg_round_counter <= reg_round_counter + 1;
        else if(reg_sm_main == ROUND) begin
            reg_round_counter <= reg_round_counter - 1;
        end
    end

    
endmodule