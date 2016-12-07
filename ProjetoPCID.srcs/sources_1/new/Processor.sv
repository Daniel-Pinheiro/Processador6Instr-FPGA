
module Processor( input       clk,
                  input [15:0] chaves,
                 output [15:0] leds );
    
    //Defini��o dos sinais dos componentes
    logic       D_rd, D_wr;
    logic       RF_Rp_zero, RF_W_addr, RF_Rp_addr, RF_Rq_addr;
    logic [0:7] D_addr, RF_W_data;
    logic [0:3] RF_W_wr, RF_Rp_rd, RF_Rq_rd;
    logic [0:1] RF_s, alu_s ;
    logic [15:0] R_data, W_data;
    
    //Defini��o do componentes
    ROM InstructionMemory( 
        rd, addr, data );

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
        RF_s[1],
        RF_s[0],
        RF_W_addr,
        RF_W_wr,
        RF_Rp_addr,
        RF_Rp_rd,
        RF_Rq_addr,
        RF_Rq_rd,
        alu_s[1],
        alu_s[0],
        W_data,
        RF_Rp_zero );
    
    RAM DataMemory(
        W_data,
        addr,
        wr,
        rd,
        chaves,
        clk,
        leds,
        R_data );
    
    //liga��o dos sinais com as sa�das
    
endmodule
