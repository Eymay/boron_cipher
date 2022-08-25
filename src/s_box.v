module s_box (
    input [3:0] i_sb, output [3:0] o_sb
);
    assign o_sb[0] = (!i_sb[3]&!i_sb[2]&i_sb[1]) | (!i_sb[2]&i_sb[1]&i_sb[0]) 
    | (!i_sb[3]&i_sb[2]&!i_sb[1]) | (i_sb[2]&!i_sb[1]&i_sb[0]) | 
    (i_sb[3]&!i_sb[2]&!i_sb[1]&!i_sb[0]) | (i_sb[3]&i_sb[2]&i_sb[1]&!i_sb[0]);

    assign o_sb[1] = (!i_sb[3]&!i_sb[2]&!i_sb[0]) | (!i_sb[3]&!i_sb[1]&!i_sb[0]) | (i_sb[2]&i_sb[1]&i_sb[0]) 
| (i_sb[3]&!i_sb[2]&i_sb[0]) | (i_sb[3]&i_sb[2]&i_sb[1]);

    assign o_sb[2] = (!i_sb[3]&!i_sb[2]&!i_sb[1]) | (!i_sb[2]&!i_sb[1]&!i_sb[0]) | (!i_sb[3]&i_sb[2]&!i_sb[0]) 
| (i_sb[3]&i_sb[1]&i_sb[0]) | (i_sb[3]&i_sb[2]&i_sb[0]);
   
    assign o_sb[3] = (!i_sb[3]&!i_sb[2]&!i_sb[0]) | (!i_sb[3]&i_sb[1]&!i_sb[0]) | (!i_sb[3]&i_sb[2]&i_sb[0]) 
| (i_sb[3]&!i_sb[1]&!i_sb[0]) | (i_sb[3]&!i_sb[2]&i_sb[1]&i_sb[0]);
endmodule