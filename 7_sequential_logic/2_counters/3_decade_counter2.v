module top_module (
    input clk,
    input reset,
    output [3:0] q);
    
    always @(posedge clk) begin
        if(reset) begin
            q <= 1;
        end else begin
            q <= (q==10)? 1:q+1;
        end
    end

endmodule