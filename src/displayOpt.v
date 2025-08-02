`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 12:41:13 PM
// Design Name: 
// Module Name: displayOpt
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


module displayOpt(
    input [1:0] in,
    output reg [7:0] disp
    );
    
    always@(in)
    begin
    case(in)
    0: disp = 7'b1001111; // Binary for E
    1: disp = 7'b0001110;// Binary for L
    2 : disp = 7'b1110111;//Binary for A
    endcase
    end
endmodule
