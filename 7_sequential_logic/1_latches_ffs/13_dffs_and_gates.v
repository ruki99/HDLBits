module top_module (
    input clk,
    input x,
    output z
); 
    
    wire d1, d2, d3;
    wire q1, q2, q3;
    
    dff_mod dff0 (.clk(clk), .d(d1), .q(q1), .q_comp(~q1));
    dff_mod dff1 (.clk(clk), .d(d2), .q(q2), .q_comp(~q2));
    dff_mod dff2 (.clk(clk), .d(d3), .q(q3), .q_comp(~q3));
    
    assign d1 = x ^ q1;
    assign d2 = x & ~q2;
    assign d3 = x | ~q3;
    assign z = ~(q1 | q2 |q3);

endmodule

module dff_mod (
    input clk,
    input d,
    output q,
    output q_comp);
    
    always @(posedge clk) begin
    	q <= d;
        q_comp <= ~q;
    end
    
endmodule