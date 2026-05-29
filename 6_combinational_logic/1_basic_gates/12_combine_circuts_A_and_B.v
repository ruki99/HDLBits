module top_module (input x, input y, output z);
    
    wire za1, zb1, za2, zb2, zor, zand;
    
    assign za1 = (x^y) & x;
    assign zb1  = (!x&!y) | (x&y);
    assign za2 = (x^y) & x;
    assign zb2  = (!x&!y) | (x&y);
    
    assign zor = za1 | zb1;
    assign zand = za2 & zb2;
    assign z = zor^zand;

endmodule