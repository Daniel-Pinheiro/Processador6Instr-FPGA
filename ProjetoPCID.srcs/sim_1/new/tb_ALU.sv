
module tb_ALU();
    logic [15:0] a;
    logic [15:0] b;
    logic [1:0]s;
    logic [15:0] out;
    
    
    alu dut(a, b, s, out);
        
    initial begin
      a = 16'b0001; b = 16'b0000; s = 0; #5;
      a = 16'b0010; b = 16'b0010; s = 1; #5;
      a = 16'b0011; b = 16'b0010; s = 2; #10;
      
      a = 16'b0000000000000001; b = 16'b01111; s = 3; #5;
      a = 16'b1000000000000000; b = 16'b11111;           
    end
endmodule
