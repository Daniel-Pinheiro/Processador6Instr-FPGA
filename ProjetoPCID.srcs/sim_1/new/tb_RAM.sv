
module tb_RAM();

    logic [15:0] W_data;
    logic [7:0] addr;
    logic wr;
    logic rd;
    logic [7:0]chaves;
    logic clk;
    logic [7:0]leds;
    logic [15:0] R_data;

    RAM sim(W_data,addr,wr,rd,chaves,clk,leds,R_data);

      // generate clock to sequence tests
    always
      begin
        clk <= 0; # 5; clk <= 1; # 5;
      end

    initial begin

    W_data = 7; wr = 1; addr = 1; #10;
    W_data = 15; wr = 1; addr = 2; #10;
    W_data = 3; wr = 1; addr = 3; #10;
    addr=255; #10;
    wr=0;
    rd=1; addr = 1; #10;
    rd=1; addr = 2; #10;
    rd=1; addr = 3; #10;
    
    rd=0;

    chaves = 3; rd=1; addr = 240; #10;
    addr = 241; #10; addr=239; #10;
    addr=255; #10;




    end

endmodule
