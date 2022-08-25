module dec_round_permutation #(
    parameter [5:0] shift = 5'b0000,
    parameter [7:0] data_length = 8'd16
)(
    input [data_length - 1:0] i_rp,  output [data_length - 1:0] o_rp
); 
    

    assign o_rp = (i_rp >> shift) | (i_rp << (data_length - shift));
endmodule