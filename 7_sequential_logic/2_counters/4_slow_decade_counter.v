module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @(posedge clk) begin
        if(reset) begin
           q <= 0; 
        end else begin
            q <= (slowena)? (q==9? 0:q+1):q;
        end
    end

endmodule