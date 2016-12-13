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

    chaves = 8'b0;
    //chaves = 8'b10101010;
    reset = 1;#20;
    reset = 0;    
       
    end
endmodule
