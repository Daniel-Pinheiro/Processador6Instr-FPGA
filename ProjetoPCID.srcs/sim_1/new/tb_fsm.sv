
module tb_FSM( );
    
    logic[0:15] IR_data;
    logic       PC_ld, PC_clr, PC_inc, clk;
    logic       I_rd, IR_ld, _D_rd, _D_wr;
    logic [0:3] _RF_Rp_zero, _RF_W_addr, _RF_Rp_addr, _RF_Rq_addr;
    logic [0:7] _D_addr, _RF_W_data;
    logic       _RF_W_wr, _RF_Rp_rd, _RF_Rq_rd;
    logic [0:1] _RF_s, _alu_s ;
    
    FSM ControlBlock( clk, _RF_Rp_zero, IR_data,
                          PC_ld, PC_clr, PC_inc,
                          I_rd, IR_ld, _D_rd, _D_wr,
                          _RF_W_addr, _RF_Rp_addr, _RF_Rq_addr,
                          _D_addr, _RF_W_data,
                          _RF_W_wr, _RF_Rp_rd, _RF_Rq_rd,
                          _RF_s, _alu_s );
    
    always
          begin
          clk=1; #5;  clk=0; #5;
          end
      
      initial begin
          _RF_Rp_zero = 1;
          IR_data= {4'b011, 4'b0100, 8'b00001111}; #40;
          IR_data= {4'b011, 4'b1000, 8'b01111000}; #30;
          
          IR_data= {4'b010, 4'b0001, 4'b1000, 4'b0100}; #30;
          IR_data= {4'b100, 4'b0000, 4'b1000, 4'b0001}; #30;
          
          IR_data= {4'b000, 4'b0100, 8'b00001111}; #30;
          IR_data= {4'b000, 4'b1000, 8'b01111000}; #30;
          IR_data= {4'b001, 4'b0100, 8'b00001111}; #30;
          IR_data= {4'b001, 4'b1000, 8'b01111000}; #30;
          
          IR_data= {4'b101, 4'b0000, 8'b00001001}; #100;
          _RF_Rp_zero = 0;
          IR_data= {4'b111, 4'b0000, 8'b01000100}; #100;
      end

endmodule