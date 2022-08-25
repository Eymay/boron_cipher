module dec_add_round_key (
    input [63:0] i_ark_cipher, [63:0] i_ark_key,
    output [63:0] o_ark_msg
);

    wire [63:0] sb2xor;
    wire [63:0] pl2sb;
    dec_permutation_layer pl(.i_pl(i_ark_cipher), .o_pl(pl2sb));
    
    
    genvar j;
    generate    
    for(j=0; j < 16; j = j + 1) begin
            dec_s_box sb(.i_sb(pl2sb[(4*j + 3):4*j]), .o_sb(sb2xor[(4*j + 3):4*j]));
        end
    endgenerate

    assign o_ark_msg = i_ark_key ^ sb2xor;
    
endmodule