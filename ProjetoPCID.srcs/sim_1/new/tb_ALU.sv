
module tb_ALU();
    logic [15:0] a;
    logic [15:0] b;
    logic  s0, s1;
    logic [15:0] out;
    
    
    alu dut(a, b, s0,s1, out);
        
    initial begin
      a = 16'b0001; b = 16'b0000; s0 = 0; s1 = 0; #5;
      a = 16'b0010; b = 16'b0010; s0 = 1; s1 = 0; #5;
      a = 16'b0011; b = 16'b0010; s0 = 0; s1 = 1; #5;
      a = 16'b0011; b = 16'b0010; s0 = 1; s1 = 1; #5;
      
    end
endmodule
