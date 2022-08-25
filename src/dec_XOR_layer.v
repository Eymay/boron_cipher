`define W0 i_xor[15:0]
`define W1 i_xor[31:16]
`define W2 i_xor[47:32]
`define W3 i_xor[63:48]



module dec_XOR_layer (
    input [63:0] i_xor, output [63:0] o_xor
);
    assign o_xor = {(`W3^`W2), (`W2^`W1^`W0),(`W3^`W2^`W1), (`W1^`W0)};

endmodule