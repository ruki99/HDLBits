module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    always @(posedge clk) begin
        if (reset) begin
            hh[3:0] <= 2;
            hh[7:4] <= 1;
            mm[3:0] <= 4'b0;
            mm[7:4] <= 4'b0;
            ss[3:0] <= 4'b0;
            ss[7:4] <= 4'b0;
            pm <= 0;
        end else begin
            if (ena) begin
               
                // seconds
                ss[3:0] <= (ss[3:0] == 9)? 0:ss[3:0]+1;
  
                if (ss[3:0] == 9) ss[7:4] <= ss[7:4]+1;
                if (ss[7:4] == 5 && ss[3:0] == 9) ss[7:4] <= 0;
                if (ss[7:4] == 0 && ss[3:0] == 9) ss[7:4] <= 1;
                
                // minutes
                if (ss == 8'h59) begin
                    mm[3:0] <= (mm[3:0] == 9)? 0:mm[3:0]+1;
                    if (mm[3:0] == 9) mm[7:4] <= mm[7:4]+1;
                	if (mm[7:4] == 5 && mm[3:0] == 9) mm[7:4] <= 0;
                	if (mm[7:4] == 0 && mm[3:0] == 9) mm[7:4] <= 1;
                end
                
                // hours
                if (mm == 8'h59 && ss == 8'h59) begin
                    // hour 0-9
                    if (hh[7:4] == 0 && hh[3:0] != 9) hh[3:0] <= hh[3:0]+1;
                    
                    //hour from 9 to 10
                    if (hh[7:4] == 0 && hh[3:0] == 9) begin
                        hh[3:0] <= 0;
                        hh[7:4] <= 1;
                    end
                    
                    // hour 11 and 12
                    if (hh[7:4] == 1 && hh[3:0] < 2) hh[3:0] <= hh[3:0]+1;
                    
                    // reset 1 after 12
                    if (hh[7:4] == 1 && hh[3:0] == 2) begin
                        hh[7:4] <= 0;
                        hh[3:0] <= 1;
                    end
                end
                    
                pm <= (hh[7:4] == 1 && hh[3:0] == 1 && 
                       mm[7:4] == 5 && mm[3:0] == 9 && 
                       ss[7:4] == 5 && ss[3:0] == 9)? ~pm:pm;
                
            end 
        end
    end
 
endmodule