module top_module ( input clk, input d, output q );
    
    
    wire dff_out1, dff_out2;
    
    my_dff inst1 (.clk(clk),
                  .d(d),
                  .q(dff_out1));

    my_dff inst2 (.clk(clk),
                  .d(dff_out1),
                  .q(dff_out2));
    
    my_dff inst3 (.clk(clk),
                  .d(dff_out2),
                  .q(q));
    
endmodule