module boron_dec_tb ();
     reg clk, rst, start;

    always begin
        #5 clk = ~clk;
    end
    wire [63:0] cipher_text;
    reg [79:0] master_key;
    wire [63:0] interface, x2sb, sb2bs, bs2rp, rp2xor,
    dxor2rp, drp2bs, dbs2sb, dsb2x;

    reg [63:0] plain_text;
    wire [63:0] resulting_text;

    add_round_key ark(.i_ark_msg(plain_text), .i_ark_key(master_key[63:0]), .o_ark_cipher(cipher_text));
    dec_add_round_key dark(.i_ark_cipher(cipher_text), .i_ark_key(master_key[63:0]), .o_ark_msg(resulting_text));
    /*
    assign x2sb = master_key[63:0] ^ cipher_text;
    genvar k;
    generate    
    for(k=0; k < 16; k = k + 1) begin
            s_box sb(.i_sb(x2sb[(4*k + 3):4*k]), .o_sb(sb2bs[(4*k + 3):4*k]));
        end
    endgenerate
    genvar i;
    generate
        for (i = 0; i < 4; i = i +1 ) begin
            block_shuffle bs(.i_bs(sb2bs[(16*i + 15):16*i]), .o_bs(bs2rp[(16*i + 15):16*i]));
        end
    endgenerate
    round_permutation #(.shift(1), .data_length(16)) rp0(.i_rp(bs2rp[(16*0 + 15):16*0]), .o_rp(rp2xor[15:0]));
    round_permutation #(.shift(4), .data_length(16)) rp1(.i_rp(bs2rp[(16*1 + 15):16*1]), .o_rp(rp2xor[(16 + 15):16*1]));
    round_permutation #(.shift(7), .data_length(16)) rp2(.i_rp(bs2rp[(16*2 + 15):16*2]), .o_rp(rp2xor[(16*2 + 15):16*2]));
    round_permutation #(.shift(9), .data_length(16)) rp3(.i_rp(bs2rp[(16*3 + 15):16*3]), .o_rp(rp2xor[(16*3 + 15):16*3]));
    XOR_layer xl(.i_xor(rp2xor), .o_xor(interface));
    dec_XOR_layer dxl(.i_xor(interface), .o_xor(dxor2rp));
    dec_round_permutation #(.shift(1), .data_length(16)) drp0(.i_rp(dxor2rp[(16*0 + 15):16*0]), .o_rp(drp2bs[15:0]));
    dec_round_permutation #(.shift(4), .data_length(16)) drp1(.i_rp(dxor2rp[(16*1 + 15):16*1]), .o_rp(drp2bs[(16 + 15):16*1]));
    dec_round_permutation #(.shift(7), .data_length(16)) drp2(.i_rp(dxor2rp[(16*2 + 15):16*2]), .o_rp(drp2bs[(16*2 + 15):16*2]));
    dec_round_permutation #(.shift(9), .data_length(16)) drp3(.i_rp(dxor2rp[(16*3 + 15):16*3]), .o_rp(drp2bs[(16*3 + 15):16*3]));

    genvar j;
    generate
        for (j = 0; j < 4; j = j +1 ) begin
            dec_block_shuffle dbs(.i_bs(drp2bs[(16*j + 15):16*j]), .o_bs(dbs2sb[(16*j + 15):16*j]));
        end
    endgenerate

    genvar m;
    generate    
    for(m=0; m < 16; m = m + 1) begin
            dec_s_box dsb(.i_sb(dbs2sb[(4*m + 3):4*m]), .o_sb(dsb2x[(4*m + 3):4*m]));
        end
    endgenerate
    assign plain_text = master_key[63:0] ^ dsb2x;
    */
    initial begin
        clk = 0;
        plain_text = 64'h29337c6644443822;
        master_key = 80'h0000080000000001c00e;

        rst = 0;
        #20;
        rst = 1;
        start = 1'b1;

        plain_text = 64'h7777aaaa3333eeee;
        master_key = 80'h0000000000000000000e;
        #100;
        plain_text = 64'h29337c6644443822;
        master_key = 80'h0000080000000001c00e;
        #100;


        
        
    end

endmodule