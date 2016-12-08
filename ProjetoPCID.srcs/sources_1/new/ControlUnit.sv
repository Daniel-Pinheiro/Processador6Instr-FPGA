
module ControlUnit( input       clk, reset, RF_Rp_zero,
                    input [0:15] I_data,
                   output [0:15] I_addr,
                   output       I_rd, D_rd, D_wr,
                   output [0:3] RF_W_addr, RF_Rp_addr, RF_Rq_addr,
                   output [0:7] D_addr, RF_W_data,
                   output       RF_W_wr, RF_Rp_rd, RF_Rq_rd,
                   output [0:1] RF_s, alu_s );

    //Definição dos sinais dos componentes
    logic[0:15] IR_data, PC_s, PC_addr;
    logic       PC_ld, PC_clr, PC_inc;
    logic       IR_ld;
    
    //Definição do componentes
    CounterPC PC(
        clk,
        PC_ld, PC_clr, PC_inc,
        PC_s, PC_addr );
    
    IR IR(
        clk, IR_ld,
        I_data, IR_data );

    Adder IncrPC(
        PC_addr, IR_data, PC_s );
    
    FSM ControlBlock( 
        clk, reset, RF_Rp_zero, IR_data,
        PC_ld, PC_clr, PC_inc,
        I_rd, IR_ld, D_rd, D_wr,
        RF_W_addr, RF_Rp_addr, RF_Rq_addr,
        D_addr, RF_W_data,
        RF_W_wr, RF_Rp_rd, RF_Rq_rd,
        RF_s, alu_s );
    
    //ligação dos sinais com as saídas
    assign I_addr = PC_addr;
    
endmodule