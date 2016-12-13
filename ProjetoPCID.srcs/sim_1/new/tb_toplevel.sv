`timescale 1ns / 1ps

module tb_topmodulo();

           logic       clk;
           logic       reset;
           logic [7:0] chaves;
           logic [7:0] leds; 

Processor dut(clk, reset, chaves,leds);

always
    begin
        clk = 0; #5; clk = 1; #5;
    end
        
    initial begin

    reset = 1;
    #30;
    reset = 0;    
    chaves = 8'b10101010;
    #1000;
    chaves = 8'b11110000;
    #1000;
    chaves = 8'b01100110;
    #1000;
    chaves = 8'b00001111;
    end
endmodule
