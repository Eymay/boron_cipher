



module dec_block_shuffle (
    input [15:0] i_bs, output [15:0] o_bs
);
    block_shuffle bs (i_bs, o_bs);
endmodule