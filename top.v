`timescale 1ns / 1ps

`define State1 2'b00
`define State2 2'b01
`define State3 2'b10
`define State4 2'b11

module top(Switch, LED, HWClock);

input [3:0] Switch; 
output reg [3:0] LED; 
input HWClock; 

reg [31:0] counter; 

reg [1:0] currentState;
wire Mhz100Clock;
clk_wiz_0 Clock1(.clk_out1(Mhz100Clock), .clk_in1(HWClock)); 

initial 
begin	
	counter <= 0; 
	LED[3:0] <= 4'b0000; 
	currentState <= Switch[1:0]; 
end


always @(posedge Mhz100Clock)
begin

    case(currentState)    
    `State1: begin
                if (currentState != Switch[1:0])
                begin
                    counter <= 0; 
                    LED[3:0] <= 4'b0000;
                    currentState <= Switch[1:0]; 
                end
                
                if (counter >= 50000000/(Switch[2] +1))
                begin
                    LED[3:0] <= ~LED[3:0]; 
                    counter <= 0; 
                end
                
                counter = counter + 1; 
                
            end
            
    `State2: begin
                if (currentState != Switch[1:0])
                begin
                    counter <= 0; 
                    LED[3:0] <= 4'b0000;
                    currentState <= Switch[1:0]; 
                end
                
                if (counter >= 50000000/(Switch[2] +1))
                begin
                    
                    case(Switch[3])
                        0: LED = LED + 1'b1;
                        1: LED = LED - 1'b1; 
                    endcase
                    
                    counter <= 0; 
                end
                
                counter = counter + 1; 
            end
            
    `State3: begin
                if (currentState != Switch[1:0])
                begin
                    counter <= 0; 
                    LED[3:0] <= 4'b0000;
                    currentState <= Switch[1:0]; 
                end
                
                if (counter >= 50000000/(Switch[2] +1))
                begin                
                    case(LED[3:0])
                    
                        4'd0: begin
                              if (Switch[3] == 0)
                                begin
                                    LED <= 4'd8;
                                    counter <= 0; 
                                end
                              else 
                                begin
                                    LED <= 4'd1;
                                    counter <= 0; 
                                end                               
                              end                              
                        
                        4'd1: begin
                                if (Switch[3] == 0)
                                begin
                                    LED <= 4'd0;
                                    counter <= 0; 
                                end
                              else 
                                begin
                                    LED <= 4'd2;
                                    counter <= 0; 
                                end 
                              end
                        4'd2: begin
                                if (Switch[3] == 0)
                                begin
                                    LED <= 4'd1;
                                    counter <= 0; 
                                end
                              else 
                                begin
                                    LED <= 4'd4;
                                    counter <= 0; 
                                end 
                              
                              end
                        4'd4: begin
                                if (Switch[3] == 0)
                                begin
                                    LED <= 4'd2;
                                    counter <= 0; 
                                end
                              else 
                                begin
                                    LED <= 4'd8;
                                    counter <= 0; 
                                end 
                              end  
                              
                        4'd8: begin
                                if (Switch[3] == 0)
                                begin
                                    LED <= 4'd4;
                                    counter <= 0; 
                                end
                              else 
                                begin
                                    LED <= 4'd0;
                                    counter <= 0; 
                                end 
                              end    
                    endcase
                end
                counter = counter + 1; 
            end
       
    `State4: begin
                if (currentState != Switch[1:0])
                begin
                    counter <= 0; 
                    LED[3:0] <= 4'b0000;
                    currentState <= Switch[1:0]; 
                end
                
                if (counter >= 50000000/(Switch[2] +1))
                begin
                    case({Switch[3], LED[3:0]})
                        5'b00000: LED[3:0] <= 4'b1000;
                        5'b01000: LED[3:0] <= 4'b1100;
                        5'b01100: LED[3:0] <= 4'b1110;
                        5'b01110: LED[3:0] <= 4'b1111;
                        5'b01111: LED[3:0] <= 4'b0111;
                        5'b00111: LED[3:0] <= 4'b0011;
                        5'b00011: LED[3:0] <= 4'b0001;
                        5'b00001: LED[3:0] <= 4'b0000;
                        5'b10000: LED[3:0] <= 4'b0001;
                        5'b10001: LED[3:0] <= 4'b0011;
                        5'b10011: LED[3:0] <= 4'b0111;
                        5'b10111: LED[3:0] <= 4'b1111;
                        5'b11111: LED[3:0] <= 4'b1110;
                        5'b11110: LED[3:0] <= 4'b1100;
                        5'b11100: LED[3:0] <= 4'b1000;
                        5'b11000: LED[3:0] <= 4'b0000;                           
                    endcase
                    counter <= 0;
                end            
                
                counter = counter + 1; 
            end
            
    default: begin
                LED[3:0] = 4'b0000; 
             end
    
    endcase
end

endmodule