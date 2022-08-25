module dec_key_scheduler (
    input clk, rst, [4:0] round_counter, [79:0] i_ks_oldkey, output [79:0] o_ks_newkey 
);
    //reg [4:0] register_counter = 5'b0;
    wire [79:0] level_shift;
    wire [79:0] level_sbox;
    wire [4:0] xor_rc;
    //wire [63:0] level_sbox;

   
    assign {level_sbox[79:64], xor_rc, level_sbox[58:0]} = i_ks_oldkey;
    assign level_sbox[63:59] = xor_rc ^(round_counter -1);
    assign level_shift[79:4] = level_sbox[79:4];
    dec_s_box sb(.i_sb(level_sbox[3:0]), .o_sb(level_shift[3:0]));


    dec_round_permutation #(.shift(13), .data_length(80)) rp (.i_rp(level_shift), .o_rp(o_ks_newkey));



    

endmodule