module dec_s_box (
    input [3:0] i_sb, output reg [3:0] o_sb 
);

    always @(*) begin
        case(i_sb)
        4'h0: o_sb = 4'hA;
        4'h1: o_sb = 4'h3;
        4'h2: o_sb = 4'h9;
        4'h3: o_sb = 4'hE;
        4'h4: o_sb = 4'h1;
        4'h5: o_sb = 4'hD;
        4'h6: o_sb = 4'hF;
        4'h7: o_sb = 4'h4;
        4'h8: o_sb = 4'hC;
        4'h9: o_sb = 4'h5;
        4'hA: o_sb = 4'h7;
        4'hB: o_sb = 4'h2;
        4'hC: o_sb = 4'h6;
        4'hD: o_sb = 4'h8;
        4'hE: o_sb = 4'h0;
        4'hF: o_sb = 4'hB;
        endcase
    end
    
endmodule