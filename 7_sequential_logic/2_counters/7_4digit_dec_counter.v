module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    decade_counter dec0 (.clk(clk), .reset(reset), .en(1), .q(q[3:0]));
    decade_counter dec1 (.clk(clk), .reset(reset), .en(ena[1]), .q(q[7:4]));
    decade_counter dec2 (.clk(clk), .reset(reset), .en(ena[2]), .q(q[11:8]));
    decade_counter dec4 (.clk(clk), .reset(reset), .en(ena[3]), .q(q[15:12]));
    
    assign ena[1] = (q[3:0] == 9)? 1:0;
    assign ena[2] = (q[3:0] == 9 && q[7:4] == 9)? 1:0;
    assign ena[3] = (q[3:0] == 9 && q[7:4] == 9 && q[11:8] == 9)? 1:0;   

endmodule


module decade_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    input en,
    output [3:0] q);
    
    always @(posedge clk) begin
        if (reset) begin
            q <= 0; 
        end else begin
            if (en) q <= (q==9)? 0:q+1;
        end
    end

endmodule