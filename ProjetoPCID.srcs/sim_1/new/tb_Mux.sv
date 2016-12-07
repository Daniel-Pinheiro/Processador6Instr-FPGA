
module tb_Mux();
    logic [15:0] d0;
    logic [15:0] d1;
    logic [15:0] d2;
    logic        s0, s1;
    logic [15:0] y;
    
    mux dut(d0, d1, d2, s0,s1, y);
            
    initial begin
         d0 = 16'b0000; d1 = 16'b0001; d2 = 16'b0010; s0 = 0; s1 = 0; #5;
         d0 = 16'b0000; d1 = 16'b0001; d2 = 16'b0010; s0 = 1; s1 = 0;  #5;
         d0 = 16'b0000; d1 = 16'b0001; d2 = 16'b0010; s0 = 0; s1 = 1;  #5;
         d0 = 16'b0000; d1 = 16'b0001; d2 = 16'b0010; s0 = 1; s1 = 1;  #5;     
    end
  
endmodule
