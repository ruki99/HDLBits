module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire cout1;
    wire [15:0] sum1, sum2;
    
    wire [31:0] b_inv;
    assign b_inv = b^{32{sub}};
    
    add16 inst1 (.a(a[15:0]),
                 .b(b_inv[15:0]),
                 .cin(sub),
                 .cout(cout1),
                 .sum(sum1));
    
    add16 inst2 (.a(a[31:16]),
                 .b(b_inv[31:16]),
                 .cin(cout1),
                 .cout(),
                 .sum(sum2));
    
    assign sum = {sum2[15:0],sum1[15:0]};

endmodule