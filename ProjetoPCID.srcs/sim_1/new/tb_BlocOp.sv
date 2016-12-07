
module tb_BlocOp();
    logic       clk;
    logic [15:0] R_data;
    logic [7:0] RF_W_data;
    logic       RF_s1;
    logic       RF_s0;
    logic [3:0] RF_W_addr;
    logic       RF_W_wr;
    logic [3:0] RF_Rp_addr;
    logic       RF_Rp_rd;
    logic [3:0] RF_Rq_addr;
    logic       RF_Rq_rd;
    logic       alu_s1;
    logic       alu_s0;
    logic [15:0] W_data;
    logic        RF_Rp_zero;
    
    
    DataPath dut(clk, R_data, RF_W_data, RF_s1, RF_s0, RF_W_addr, RF_W_wr, RF_Rp_addr, RF_Rp_rd, RF_Rq_addr, RF_Rq_rd, alu_s1, alu_s0, W_data, RF_Rp_zero);
    
    always
    begin
      clk <= 0; # 5; clk <= 1; # 5;
    end
    
     initial begin
        R_data = 0; RF_W_data = 5; RF_W_addr = 0; RF_W_wr = 1; RF_s1 = 1; RF_s0 = 0; #10;
        RF_W_data = 2; RF_W_addr = 1; RF_W_wr = 1; RF_s1 = 1; RF_s0 = 0; #10;
        
        RF_W_wr = 0; 
        
        RF_Rp_addr = 0; RF_Rp_rd = 1; #10;
        RF_Rp_rd = 0;
        RF_Rq_addr = 1; RF_Rq_rd = 1; #10;
        
        //RF_Rp_rd = 0;
        
        alu_s1 = 0; alu_s0 = 0; #10;
        alu_s1 = 0; alu_s0 = 1; #10;
        alu_s1 = 1; alu_s0 = 0; #10;
        
        
    end

endmodule
