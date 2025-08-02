`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2025 04:12:23 PM
// Design Name: 
// Module Name: digits
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


module digits(
    input tenHzClk,
    input rst,
    output reg [3:0] ones,
    output reg [3:0] tens,
    output reg [3:0] hundreds,
    output reg [3:0] thousands,
    output reg [3:0] tenthousands,
    output reg [3:0] hundredthousands,
    output reg [3:0] millions,
    output reg [3:0] tenmillions
    );
    
    always@(posedge tenHzClk or posedge rst)
        if(rst)
            ones <= 0;
        else 
            if(ones == 9)
                ones <= 0;
            else
                ones <= ones + 1;
                
    always@(posedge tenHzClk or posedge rst)
        if(rst)
            tens <= 0;
        else 
            if(ones == 9)
                if(tens == 9)
                    tens <= 0;
                else
                    tens <= tens + 1;
   
    always@(posedge tenHzClk or posedge rst)
        if(rst)
            hundreds <= 0;
        else 
            if(tens == 9 && ones == 9)
                if(hundreds == 9)
                    hundreds <= 0;
                else
                    hundreds <= hundreds + 1;
                
    always@(posedge tenHzClk or posedge rst)
        if(rst)
            thousands <= 0;
        else 
            if(hundreds == 9 && tens == 9 && ones == 9)
                if(thousands == 9)
                    thousands <= 0;
                else
                    thousands <= thousands + 1;
                    
     always@(posedge tenHzClk or posedge rst)              
         if(rst)                                
             tenthousands <= 0;                    
         else                                   
             if(hundreds == 9 && tens == 9 && ones == 9 && thousands == 9)
                 if(tenthousands == 9)             
                     tenthousands <= 0;            
                 else                           
                     tenthousands <= tenthousands + 1;

    always@(posedge tenHzClk or posedge rst)              
         if(rst)                                
             hundredthousands <= 0;                    
         else                                   
             if(hundreds == 9 && tens == 9 && ones == 9 && thousands == 9 && tenthousands == 9)
                 if(hundredthousands == 9)             
                     hundredthousands <= 0;            
                 else                           
                     hundredthousands <= hundredthousands + 1;
                     
    always@(posedge tenHzClk or posedge rst)              
         if(rst)                                
             millions <= 0;                    
         else                                   
             if(hundreds == 9 && tens == 9 && ones == 9 && thousands == 9 && tenthousands == 9 && hundredthousands == 9)
                 if(millions == 9)             
                     millions <= 0;            
                 else                           
                     millions <= millions + 1;

    always@(posedge tenHzClk or posedge rst)              
         if(rst)                                
             tenmillions <= 0;                    
         else                                   
             if(hundreds == 9 && tens == 9 && ones == 9 && thousands == 9 && tenthousands == 9 && hundredthousands == 9 && millions == 9)
                 if(tenmillions == 9)             
                     tenmillions <= 0;            
                 else                           
                     tenmillions <= tenmillions + 1;
endmodule