`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 12:54:04 PM
// Design Name: 
// Module Name: 1Hzclkdiv
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


module OneHzclkdiv(
    input clk,
    output reg clkout
    );
    
    reg [28:0] periodCount = 0;
    
    always @ (posedge clk) begin
    if(periodCount != 50_000_000 - 1) begin
        periodCount <= periodCount + 1;
        clkout <= 0;
    end
    else
    begin
        periodCount <= 0;
        clkout <= 1;
    end
    end
endmodule
