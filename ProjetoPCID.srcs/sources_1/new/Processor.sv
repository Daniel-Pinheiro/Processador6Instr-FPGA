
module Processor( input       clk,
                  input [15:0] chaves,
                 output [15:0] leds );
    
    //Definição dos sinais dos componentes
    logic       D_rd, D_wr;
    logic       RF_Rp_zero, RF_W_addr, RF_Rp_addr, RF_Rq_addr;
    logic [0:7] D_addr, RF_W_data;
    logic [0:3] RF_W_wr, RF_Rp_rd, RF_Rq_rd;
    logic [0:1] RF_s, alu_s ;
    
    logic [15:0] R_data;
    logic       RF_s1;
    logic       RF_s0;
    logic       alu_s1;
    logic       alu_s0;
    logic [15:0] W_data;
    
    //Definição do componentes
    ControlUnit ControlUnit( 
        clk, RF_Rp_zero,
        data, addr,
        rd, D_rd, D_wr,
        RF_W_addr, RF_Rp_addr, RF_Rq_addr,
        D_addr, RF_W_data,
        RF_W_wr, RF_Rp_rd, RF_Rq_rd,
        RF_s, alu_s );
    
    DataPath OperationalBlock(
        clk,
        R_data,
        RF_W_data,
        RF_s1,
        RF_s0,
        RF_W_addr,
        RF_W_wr,
        RF_Rp_addr,
        RF_Rp_rd,
        RF_Rq_addr,
        RF_Rq_rd,
        alu_s1,
        alu_s0,
        W_data,
        RF_Rp_zero );
    
    DataMemory RAM(
        W_data,
        addr,
        wr,
        rd,
        chaves,
        clk,
        leds,
        R_data );
    
    //ligação dos sinais com as saídas
    
endmodule
