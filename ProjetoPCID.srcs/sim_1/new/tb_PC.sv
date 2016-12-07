
module tb_PC( );
    logic pc_ld;
logic clr;
logic pc_inc;
logic clk;
logic [15:0] s;
logic [15:0] pc_addr;

CounterPC dut(pc_ld, clr, pc_inc, clk, s, pc_addr);
   
    always
       begin
         clk <= 0; # 5; clk <= 1; # 5;
    end 
           
    initial begin
        clr = 1; pc_ld = 0; #10;
        clr = 0; #10;
        pc_ld = 1; s = 16'b0010; #10;
        pc_ld = 0; pc_inc = 1; #1000;
        clr = 1;
          
     end
endmodule
