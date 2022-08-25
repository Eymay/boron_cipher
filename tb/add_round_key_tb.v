module add_round_key_tb ();
    reg [63:0] i_ark_msg;
    reg [79:0] i_ark_key;
    wire [63:0] o_ark_cipher, inverse_xor, desired_input2xor;
    
    add_round_key ark(.i_ark_msg(i_ark_msg), .i_ark_key(i_ark_key), .o_ark_cipher(o_ark_cipher));
    
    dec_XOR_layer xld(.i_xor(o_ark_cipher), .o_xor(inverse_xor));
    dec_XOR_layer xld2(.i_xor(64'h7777_aaaa_3333_eeee), .o_xor(desired_input2xor));
    
    initial begin
        i_ark_key = 0;
        i_ark_msg = 0;
        
        
    end

endmodule