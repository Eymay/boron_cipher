module boron_enc_tb ();
     reg clk, rst, start;

    always begin
        #5 clk = ~clk;
    end
    reg [63:0] plain_text;
    reg [79:0] master_key;
    wire [63:0] cipher_text;
    wire  [63:0] desired_text;
    wire done;
    
    boron_enc be(.clk(clk), .rst(rst), .start(start), .plain_text(plain_text), 
    .master_key(master_key), .done(done), .cipher_text(cipher_text));

    dec_add_round_key dark(.i_ark_cipher(cipher_text), .i_ark_key(be.reg_key), .o_ark_msg(desired_text));
    initial begin
        clk = 0;
        plain_text = 64'd0;
        master_key = 80'h00000000000000000000;

        rst = 0;
        #20;
        rst = 1;
        start = 1'b1;

        
        
    end

endmodule