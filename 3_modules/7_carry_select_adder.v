module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    wire [15:0] sum1,sum2;
    
    add16 inst1 (.a(a[31:16]),
                 .b(b[31:16]),
                 .cin(1'b0),
                 .cout(1'b0),
                 .sum(sum1));
    
    add16 inst2 (.a(a[31:16]),
                 .b(b[31:16]),
                 .cin(1'b1),
                 .cout(1'b0),
                 .sum(sum2));
    
    add16 inst3 (.a(a[15:0]),
                 .b(b[15:0]),
                 .cin(1'b0),
                 .cout(cout),
                 .sum(sum[15:0]));
    
    
    always @ (*) begin
        case (cout)
            1'b0: sum[31:16] = sum1;
            1'b1: sum[31:16] = sum2;
            default: sum[31:16] = 0;
        endcase
    end  

endmodule