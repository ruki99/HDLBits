module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    reg [7:0] counter;
    always @ (*) begin
        counter = 0;
        for (int i = 0; i < $bits(in); i++ ) begin
            counter = (in[i] == 1) ? counter+1 : counter;
        end
    end
    
    assign out = counter;

endmodule