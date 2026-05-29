// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    
    always @(*) begin
        case (in)
            4'd0000: pos = 0; // 0000
            4'd0001: pos = 0; // 0001
            4'd0002: pos = 1; // 0010
            4'd0003: pos = 0; // 0011 
            4'd0004: pos = 2; // 0100
            4'd0005: pos = 0; // 0101
            4'd0006: pos = 1; // 0110
            4'd0007: pos = 0; // 0111
            4'd0008: pos = 3; // 1000
            4'd0009: pos = 0; // 1001
            4'd0010: pos = 1; // 1010
            4'd0011: pos = 0; // 1011
            4'd0012: pos = 2; // 1100
            4'd0013: pos = 0; // 1101
            4'd0014: pos = 1; // 1110
            4'd0015: pos = 0; // 1111
            default: pos = 0;
        endcase
    end

endmodule