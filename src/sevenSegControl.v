`timescale 1ns / 1ps

module sevenSegControl(
    input clk,
    input rst,
    input [3:0] ones,
    input [3:0] tens,
    input [3:0] hundreds,
    input [3:0] thousands,
    input [3:0] tenthousands,
    input [3:0] hundredthousands,
    input [3:0] millions,
    input [3:0] tenmillions,
    output reg [0:6] seg,
    output reg [7:0] digit
    );
    
    parameter zero = 7'b000_0001;
    parameter one = 7'b100_1111;
    parameter two = 7'b001_0010;
    parameter three =  7'b000_0110;
    parameter four = 7'b100_1100;
    parameter five = 7'b010_0100;
    parameter six = 7'b010_0000;
    parameter seven = 7'b000_1111;
    parameter eight = 7'b000_0000;
    parameter nine = 7'b000_0100;
    
    reg [3:0] digitSelect;
    reg [16:0] digitTimer;
    
    always@(posedge clk or posedge rst)begin
        if(rst)begin
            digitSelect <= 0;
            digitTimer <= 0;
        end
        else
            if(digitTimer == 99999)begin
                digitTimer <= 0;
                digitSelect <= digitSelect + 1;
            end
            else
                digitTimer <= digitTimer + 1;
    end
    
    always @(digitSelect)begin
        case(digitSelect)
            3'b000 : digit = 8'b11111110;
            3'b001 : digit = 8'b11111101;
            3'b010 : digit = 8'b11111011;
            3'b011 : digit = 8'b11110111;
            3'b100 : digit = 8'b11101111;
            3'b101 : digit = 8'b11011111;
            3'b110 : digit = 8'b10111111;
            3'b111 : digit = 8'b01111111;   
        endcase
    end
        
    always @ *
        begin
             case(digitSelect)
                3'b000 : begin
                            case(ones)
                                4'b0000 : seg = zero;
                                4'b0001 : seg = one;
                                4'b0010 : seg = two;
                                4'b0011 : seg = three;
                                4'b0100 : seg = four;
                                4'b0101 : seg = five;
                                4'b0110 : seg = six;    
                                4'b0111 : seg = seven;
                                4'b1000 : seg = eight;
                                4'b1001 : seg = nine;
                             endcase
                        end
                        
                3'b001 : begin                                  
                            case(tens)                 
                                4'b0000 : seg = zero;  
                                4'b0001 : seg = one;   
                                4'b0010 : seg = two;   
                                4'b0011 : seg = three; 
                                4'b0100 : seg = four;  
                                4'b0101 : seg = five;  
                                4'b0110 : seg = six;   
                                4'b0111 : seg = seven; 
                                4'b1000 : seg = eight; 
                                4'b1001 : seg = nine;  
                             endcase                   
                        end                            
                3'b010 : begin                          
                            case(hundreds)                 
                                4'b0000 : seg = zero;  
                                4'b0001 : seg = one;   
                                4'b0010 : seg = two;   
                                4'b0011 : seg = three; 
                                4'b0100 : seg = four;  
                                4'b0101 : seg = five;  
                                4'b0110 : seg = six;   
                                4'b0111 : seg = seven; 
                                4'b1000 : seg = eight; 
                                4'b1001 : seg = nine;  
                             endcase                   
                        end                            
                3'b011 : begin                          
                            case(thousands)                 
                                4'b0000 : seg = zero;  
                                4'b0001 : seg = one;   
                                4'b0010 : seg = two;   
                                4'b0011 : seg = three; 
                                4'b0100 : seg = four;  
                                4'b0101 : seg = five;  
                                4'b0110 : seg = six;   
                                4'b0111 : seg = seven; 
                                4'b1000 : seg = eight; 
                                4'b1001 : seg = nine;  
                             endcase                   
                        end
                 3'b100 : begin                          
                            case(tenthousands)                 
                                4'b0000 : seg = zero;  
                                4'b0001 : seg = one;   
                                4'b0010 : seg = two;   
                                4'b0011 : seg = three; 
                                4'b0100 : seg = four;  
                                4'b0101 : seg = five;  
                                4'b0110 : seg = six;   
                                4'b0111 : seg = seven; 
                                4'b1000 : seg = eight; 
                                4'b1001 : seg = nine;  
                             endcase                   
                        end
                 3'b101 : begin                          
                            case(hundredthousands)                 
                                4'b0000 : seg = zero;  
                                4'b0001 : seg = one;   
                                4'b0010 : seg = two;   
                                4'b0011 : seg = three; 
                                4'b0100 : seg = four;  
                                4'b0101 : seg = five;  
                                4'b0110 : seg = six;   
                                4'b0111 : seg = seven; 
                                4'b1000 : seg = eight; 
                                4'b1001 : seg = nine;  
                             endcase                   
                        end
                  3'b110 : begin                          
                            case(millions)                 
                                4'b0000 : seg = zero;  
                                4'b0001 : seg = one;   
                                4'b0010 : seg = two;   
                                4'b0011 : seg = three; 
                                4'b0100 : seg = four;  
                                4'b0101 : seg = five;  
                                4'b0110 : seg = six;   
                                4'b0111 : seg = seven; 
                                4'b1000 : seg = eight; 
                                4'b1001 : seg = nine;  
                             endcase                   
                        end
                 
                  3'b111 : begin                          
                            case(tenmillions)                 
                                4'b0000 : seg = zero;  
                                4'b0001 : seg = one;   
                                4'b0010 : seg = two;   
                                4'b0011 : seg = three; 
                                4'b0100 : seg = four;  
                                4'b0101 : seg = five;  
                                4'b0110 : seg = six;   
                                4'b0111 : seg = seven; 
                                4'b1000 : seg = eight; 
                                4'b1001 : seg = nine;  
                             endcase                   
                        end
                 endcase
          end
endmodule                            
                
