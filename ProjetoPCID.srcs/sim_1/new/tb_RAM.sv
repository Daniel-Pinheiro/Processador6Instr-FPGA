
module tb_RAM();

    logic [15:0] W_data;
    logic [7:0] addr;
    logic wr;
    logic rd;
    logic [7:0]chaves;
    logic clk;
    logic [7:0]leds;
    logic [15:0] R_data;

    RAM sim(reset,W_data,addr,wr,rd,chaves,clk,leds,R_data);

      // generate clock to sequence tests
    always
      begin
        clk <= 0; # 5; clk <= 1; # 5;
      end

    initial begin
    
    wr = 0; rd = 0; #10;
    
    /*
    W_data = 7;  wr = 1; addr = 1; #10;
    W_data = 15; wr = 1; addr = 2; #10;*/
    W_data = 3;  wr = 1; addr = 3; #10;

    addr=255; #10;
    addr=254; #10;
    addr=253; #10;
    addr=252; #10;
    addr=251; #10;
    addr=250; #10;
    addr=249; #10;
    addr=248; #10;
    wr=0;
    rd=1; addr = 1; #10;
    rd=1; addr = 2; #10;
    rd=1; addr = 3; #10;
    
    rd=0;
    wr = 1; #10;
    W_data = 15; #10;
    addr = 240; #10; 
    addr = 241; #10; 
    addr = 242; #10; 
    addr = 243; #10; 
    addr = 244; #10; 
    addr = 245; #10; 
    addr = 246; #10; 
    addr = 247;#10; 
    
   // chaves[0] = 1; addr = 240; #10; 
   // chaves[1] = 1; addr = 241;#10; 
   // chaves[2] = 1; addr = 242;#10; 
   // chaves[3] = 0; addr = 243;#10; 
   // chaves[4] = 1; addr = 244;#10; 
   // chaves[5] = 1; addr = 245;#10; 
   // chaves[6] = 1; addr = 246;#10; 
   // chaves[7] = 1; addr = 247;#10; 
    
    wr = 0; #10;
    
    rd=1; #10;
    
    addr = 240; #10;
    addr = 241; #10;
    addr = 242; #10;
    addr = 243; #10;
    addr = 244; #10;
    addr = 245; #10;                
    addr = 246; #10;
    addr = 247; #10;
    
    
    
    
    
    end

endmodule
