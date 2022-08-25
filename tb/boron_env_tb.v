module boron_env ();
    reg clk, rst, start;
    reg [63:0] plain_text;
    reg [79:0] master_key;
    wire done_enc, done_dec;
    wire [63:0] cipher_text, resulting_text;

    always begin
        #5 clk = ~clk;
    end
    boron_enc be(.clk(clk), .rst(rst), .start(start), .plain_text(plain_text), .master_key(master_key), .done(done_enc), .cipher_text(cipher_text));
    boron_dec bd(.clk(clk), .rst(rst), .start(done_enc), .plain_text(cipher_text), .master_key(master_key), .done(done_dec), .cipher_text(resulting_text));

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