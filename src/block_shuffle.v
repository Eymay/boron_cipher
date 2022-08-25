`define P0 i_bs[3:0]
`define P1 i_bs[7:4]
`define P2 i_bs[11:8]
`define P3 i_bs[15:12]



module block_shuffle (
    input [15:0] i_bs, output [15:0] o_bs
);
    assign o_bs = {`P1, `P0, `P3, `P2};

endmodule