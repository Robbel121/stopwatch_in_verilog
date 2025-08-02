`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2025 03:48:34 PM
// Design Name: 
// Module Name: OneHzEnable
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module OneHzEnable(
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
