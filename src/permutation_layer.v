module permutation_layer (
    input [63:0] i_pl, output [63:0] o_pl
);
    wire [63:0] bs2rp;
    //wire [63:0] rp2fixer;
    wire [63:0] rp2xor;

    genvar i;
    generate
        for (i = 0; i < 4; i = i +1 ) begin
            block_shuffle bs(.i_bs(i_pl[(16*i + 15):16*i]), .o_bs(bs2rp[(16*i + 15):16*i]));
        end
    endgenerate
            round_permutation #(.shift(1), .data_length(16)) rp0(.i_rp(bs2rp[(16*0 + 15):16*0]), .o_rp(rp2xor[15:0]));
            round_permutation #(.shift(4), .data_length(16)) rp1(.i_rp(bs2rp[(16*1 + 15):16*1]), .o_rp(rp2xor[(16 + 15):16*1]));
            round_permutation #(.shift(7), .data_length(16)) rp2(.i_rp(bs2rp[(16*2 + 15):16*2]), .o_rp(rp2xor[(16*2 + 15):16*2]));
            round_permutation #(.shift(9), .data_length(16)) rp3(.i_rp(bs2rp[(16*3 + 15):16*3]), .o_rp(rp2xor[(16*3 + 15):16*3]));

/*
    round_permutation #(
            .shift(13)

            ) rp(
            .i_rp(rp2fixer[63:48]), 
            .o_rp(fixer2xor[63:48])
            );
    assign fixer2xor[47:0] = rp2fixer[47:0];
            */

    XOR_layer xl(.i_xor(rp2xor), .o_xor(o_pl));

endmodule