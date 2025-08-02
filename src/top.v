`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2025 03:48:34 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    output [0:6] seg,
    output [7:0] digit
    );
    
    wire tenhzclk;
    wire [7:0] w1s, w10s, w100s, w1000s;
    
    OneHzEnable hzten(.clk(clk), .rst(rst), .tenHzClk(tenhzclk));
    
    digits dig(.tenHzClk(tenhzclk), .rst(rst), .ones(w1s), .tens(w10s), .hundreds(w100s),.thousands(w1000s));
    
    sevenSegControl control(.clk(clk), .rst(rst),.ones(w1s), .tens(w10s), .hundreds(w100s),.thousands(w1000s), . seg(seg), .digit(digit) );
    
endmodule
