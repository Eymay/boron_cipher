module round_permutation_tb ();
    
    reg [15:0] i_rp;
    wire [15:0] o_rp [17:0];

    round_permutation #(.shift(0), .data_length(16)) rp0(.i_rp(i_rp), .o_rp(o_rp[0]));
    round_permutation #(.shift(1), .data_length(16)) rp1(.i_rp(i_rp), .o_rp(o_rp[1]));
    round_permutation #(.shift(2), .data_length(16)) rp2(.i_rp(i_rp), .o_rp(o_rp[2]));
    round_permutation #(.shift(3), .data_length(16)) rp3(.i_rp(i_rp), .o_rp(o_rp[3]));
    round_permutation #(.shift(4), .data_length(16)) rp4(.i_rp(i_rp), .o_rp(o_rp[4]));
    round_permutation #(.shift(5), .data_length(16)) rp5(.i_rp(i_rp), .o_rp(o_rp[5]));
    round_permutation #(.shift(6), .data_length(16)) rp6(.i_rp(i_rp), .o_rp(o_rp[6]));
    round_permutation #(.shift(7), .data_length(16)) rp7(.i_rp(i_rp), .o_rp(o_rp[7]));
    round_permutation #(.shift(8), .data_length(16)) rp8(.i_rp(i_rp), .o_rp(o_rp[8]));
    round_permutation #(.shift(9), .data_length(16)) rp9(.i_rp(i_rp), .o_rp(o_rp[9]));
    round_permutation #(.shift(10), .data_length(16)) rp10(.i_rp(i_rp), .o_rp(o_rp[10]));
    round_permutation #(.shift(11), .data_length(16)) rp11(.i_rp(i_rp), .o_rp(o_rp[11]));
    round_permutation #(.shift(12), .data_length(16)) rp12(.i_rp(i_rp), .o_rp(o_rp[12]));
    round_permutation #(.shift(13), .data_length(16)) rp13(.i_rp(i_rp), .o_rp(o_rp[13]));
    round_permutation #(.shift(14), .data_length(16)) rp14(.i_rp(i_rp), .o_rp(o_rp[14]));
    round_permutation #(.shift(15), .data_length(16)) rp15(.i_rp(i_rp), .o_rp(o_rp[15]));
    round_permutation #(.shift(16), .data_length(16)) rp16(.i_rp(i_rp), .o_rp(o_rp[16]));
    round_permutation #(.shift(17), .data_length(16)) rp17(.i_rp(i_rp), .o_rp(o_rp[17]));
         
    initial begin
       i_rp = 16'h7EF5; 
     

    end
endmodule