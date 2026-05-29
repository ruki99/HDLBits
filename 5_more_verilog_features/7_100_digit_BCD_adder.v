module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] cout_tmp;
    
    bcd_fadd bcd_fadd0 (.a(a[3:0]), 
                        .b(b[3:0]), 
                        .cin(cin),
                        .cout(cout_tmp[0]),
                        .sum(sum[3:0]));
    
    genvar i;
    generate
        for (i = 1; i < 100; i++) begin: gen_statement
            bcd_fadd bcd_fadd_i (.a(a[4*i+3:4*i]), 
                                 .b(b[4*i+3:4*i]), 
                                 .cin(cout_tmp[i - 1]), 
                                 .cout(cout_tmp[i]), 
                                 .sum(sum[4*i+3:4*i]));
        end
    endgenerate
    
    assign cout = cout_tmp[99];

endmodule