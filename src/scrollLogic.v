`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 01:24:10 PM
// Design Name: 
// Module Name: scrollLogic
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


module scrollLogic(
    input clk,
    input rst,
    output [6:0] seg,
    output reg [3:0] anode
    );
    
    wire hunnedClk;
    wire oneClk;
    reg [2:0] scroll;
    reg [3:0] fourth, third, second, first;
    
    reg [3:0] D;
    
    OneHzclkdiv U0(.clk(clk), .clkout(oneClk));
    hunnedHzclkdiv U1(.clk(clk), .clkout(hunnedClk));
    
    always @ (posedge oneClk or posedge rst)begin
        if(rst)
            scroll <= 0;
        else if (scroll == 4)
            scroll <= 1;
        else
            scroll <= scroll + 1;
    end
    
    always@(posedge oneClk)
    begin
        case(scroll)
        0 : 
        begin
            fourth = 0;
            third = 1;
            second = 1;
            first = 2;
        end
        
        1 : 
        begin
            fourth = 1;
            third = 1;
            second = 2;
            first = 0;
        end
        
        2 : 
        begin
            fourth = 1;
            third = 2;
            second = 0;
            first = 1;
        end
        
        3 : 
        begin
            fourth = 2;
            third = 0;
            second = 1;
            first = 1;
        end
        
        4 : 
        begin
            fourth = 0;
            third = 1;
            second = 1;
            first = 2;
        end
        endcase
    end
       
       
    reg [1:0] count;   
    always@(posedge hunnedClk)
    begin
        if(rst)
            count <= 0;
        else 
            count <= count +1;
    
        case(count)
            2'b00 : 
            begin
                D = first;
                anode = 4'b1110;
            end
        
            2'b01 : 
            begin
                D = second;
                anode = 4'b1101;
            end
        
            2'b10 : 
            begin
                D = third;
                anode = 4'b1011;
            end
            
            2'b11 : 
            begin
                D = fourth;
                anode = 4'b0111;
            end
        endcase
    end
    
    displayOpt U3(D, seg);
    
endmodule
