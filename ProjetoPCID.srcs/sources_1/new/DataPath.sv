
module DataPath(
    input logic       clk,
    input logic [15:0] R_data,
    input logic [7:0] RF_W_data,
    input logic       RF_s1,
    input logic       RF_s0,
    input logic [3:0] RF_W_addr,
    input logic       RF_W_wr,
    input logic [3:0] RF_Rp_addr,
    input logic       RF_Rp_rd,
    input logic [3:0] RF_Rq_addr,
    input logic       RF_Rq_rd,
    input logic       alu_s1,
    input logic       alu_s0,
    output logic [15:0] W_data,
    output logic        RF_Rp_zero
    );
    
    logic [15:0] mux_rf, a, b, alu_mux;
    
    alu ALU(a, b, alu_s0, alu_s1, alu_mux);
    mux Mux(alu_mux, R_data, RF_W_data, RF_s0, RF_s1, mux_rf); 
    RegFile RF(mux_rf, RF_W_addr,RF_W_wr, RF_Rp_addr, RF_Rp_rd, RF_Rq_addr, RF_Rq_rd, clk, a, b);
    
    assign RF_Rp_zero = (a == 0);
    
    assign W_data = a;
    
    endmodule
