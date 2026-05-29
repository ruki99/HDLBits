module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    
    reg [31:0] last_in;
    
    always @(posedge clk) begin
        last_in <= in;
        if(reset) begin 
            out <= 0;
        end else begin
            out <= (~in&last_in) | out;
        end
    end

endmodule