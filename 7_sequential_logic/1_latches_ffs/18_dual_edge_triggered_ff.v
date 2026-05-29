module top_module (
    input clk,
    input d,
    output q
);
    
    wire d_pos, d_neg;
    
    always @(posedge clk) begin
        d_pos <= d;
    end
    
    always @(negedge clk) begin
        d_neg <= d;
    end
    
    assign q = clk? d_pos : d_neg;

endmodule