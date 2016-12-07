
module tb_Inc( );
    logic [15:0] a;
    logic [15:0] b;
    logic [15:0] saida;
    
    IncPC dut(a, b, saida);
            
    initial begin
       a = 16'b0000; b = 16'b0001; #5;
       a = 16'b0001; b = 16'b0001; #5;
       a = 16'b0010; b = 16'b0011; #5;
       a = 16'b0101; b = 16'b0011; #5;
       
    end
endmodule
