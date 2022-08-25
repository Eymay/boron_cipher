module dec_permutation_layer (
    input [63:0] i_pl, output [63:0] o_pl
);
    wire [63:0] rp2bs;
    //wire [63:0] rp2fixer;
    wire [63:0] xor2rp;

    dec_XOR_layer xl(.i_xor(i_pl), .o_xor(xor2rp));

            dec_round_permutation #(.shift(1), .data_length(16)) rp0(.i_rp(xor2rp[(16*0 + 15):16*0]), .o_rp(rp2bs[15:0]));
            dec_round_permutation #(.shift(4), .data_length(16)) rp1(.i_rp(xor2rp[(16*1 + 15):16*1]), .o_rp(rp2bs[(16 + 15):16*1]));
            dec_round_permutation #(.shift(7), .data_length(16)) rp2(.i_rp(xor2rp[(16*2 + 15):16*2]), .o_rp(rp2bs[(16*2 + 15):16*2]));
            dec_round_permutation #(.shift(9), .data_length(16)) rp3(.i_rp(xor2rp[(16*3 + 15):16*3]), .o_rp(rp2bs[(16*3 + 15):16*3]));

    genvar i;
    generate
        for (i = 0; i < 4; i = i +1 ) begin
            dec_block_shuffle bs(.i_bs(rp2bs[(16*i + 15):16*i]), .o_bs(o_pl[(16*i + 15):16*i]));
        end
    endgenerate
/*
    round_permutation #(
            .shift(13)

            ) rp(
            .i_rp(rp2fixer[63:48]), 
            .o_rp(fixer2xor[63:48])
            );
    assign fixer2xor[47:0] = rp2fixer[47:0];
            */


endmodule