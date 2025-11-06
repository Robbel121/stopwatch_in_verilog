`timescale 1ns / 1ps

module top(
    input clk,
    input rst,
    output [0:6] seg,
    output [7:0] digit
    );
    
    wire tenhzclk;
    wire [7:0] w1s, w10s, w100s, w1000s;
    
    TenHzEnable hzten(.clk(clk), .rst(rst), .tenHzClk(tenhzclk));
    
    digits dig(.tenHzClk(tenhzclk), .rst(rst), .ones(w1s), .tens(w10s), .hundreds(w100s),.thousands(w1000s));
    
    sevenSegControl control(.clk(clk), .rst(rst),.ones(w1s), .tens(w10s), .hundreds(w100s),.thousands(w1000s), . seg(seg), .digit(digit) );
    
endmodule
