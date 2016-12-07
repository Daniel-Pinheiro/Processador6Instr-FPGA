
module tb_IR( );
    logic [15:0] data;
    logic load;
    logic clk;
    logic [15:0] inst;
    
    IR dut(data, load, clk, inst);
    
    always
       begin
         clk <= 0; # 5; clk <= 1; # 5;
    end 
           
    initial begin
        data = 16'b0001; load = 0;  #10;
        data = 16'b0010; load = 1;  #10;
        data = 16'b0011; load = 0;  #10;
        data = 16'b0100; load = 1;  #10;
        data = 16'b0111; load = 0;  #10;  
     end
endmodule
