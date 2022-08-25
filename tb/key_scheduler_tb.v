module key_scheduler_tb ();
    
    reg clk, rst;
    reg [79:0] i_ks_oldkey;
    reg [4:0] round_counter = 5'b00001;
    wire [79:0] o_ks_newkey;

    key_scheduler ks(.clk(clk), .rst(rst), .round_counter(round_counter), .i_ks_oldkey(i_ks_oldkey), .o_ks_newkey(o_ks_newkey));

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        i_ks_oldkey = 80'h00000000000000000000;

        rst = 0;
        #20;
        rst = 1;


    end

endmodule