module add_round_key (
    input [63:0] i_ark_msg, [63:0] i_ark_key,
    output [63:0] o_ark_cipher
);

    wire [63:0] xor_msg_key;
    wire [63:0] sb2pl;
    
    assign xor_msg_key = i_ark_key ^ i_ark_msg;
    
    genvar j;
    generate    
    for(j=0; j < 16; j = j + 1) begin
            s_box sb(.i_sb(xor_msg_key[(4*j + 3):4*j]), .o_sb(sb2pl[(4*j + 3):4*j]));
        end
    endgenerate

    permutation_layer pl(.i_pl(sb2pl), .o_pl(o_ark_cipher));
    
endmodule