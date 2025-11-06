`timescale 1ns / 1ps

module TenHzEnable(
    input clk,
    input rst,
    output tenHzClk
    );
    
    reg [22:0] counter = 0;
    reg clkOutreg = 0;
    
    
    always@(posedge clk or posedge rst) 
    begin
        if(rst) begin
            counter <= 0;
            clkOutreg <= 0;
        end
        else 
            if(counter == 4999999) begin
                counter <= 0;
                clkOutreg <= ~clkOutreg;
            end 
            else 
                counter <= counter + 1;
                
            
        end
    assign tenHzClk = clkOutreg;
endmodule
