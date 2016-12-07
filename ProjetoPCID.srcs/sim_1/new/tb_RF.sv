
module tb_RF();
    logic [15:0] W_data;
    logic [3:0] W_addr;
    logic W_wr;
    logic [3:0] Rp_addr;
    logic Rp_rd;
    logic [3:0] Rq_addr;
    logic Rq_rd;
    logic clk;
    logic [15:0] Rp_data;
    logic [15:0] Rq_data;
    
    RegFile sim(W_data,W_addr,W_wr,Rp_addr,Rp_rd,Rq_addr,Rq_rd,clk,Rp_data,Rq_data);
    
  // generate clock to sequence tests
  always
    begin
      clk <= 0; # 5; clk <= 1; # 5;
    end

    initial begin
        W_data = 7; W_addr = 0; W_wr = 1; #10;
        W_data = 45; W_addr = 1; W_wr = 1; #10;
        W_data = 10; W_addr = 2; W_wr = 1; #10;
        W_data = 0; W_addr = 3; W_wr = 1; #10;
        W_wr = 0;
        Rp_addr = 0; Rp_rd = 1; #10;
        Rp_addr = 2; Rp_rd = 1; #10;
        Rp_rd = 0;
        Rq_addr = 1; Rq_rd = 1; #10;
        Rq_addr = 3; Rq_rd = 1; #10;
    end

endmodule
