
module Processor(input       clk
                 );
    
    //Definição dos sinais dos componentes
    logic       D_rd, D_wr;
    logic       RF_Rp_zero, RF_W_addr, RF_Rp_addr, RF_Rq_addr;
    logic [0:7] D_addr, RF_W_data;
    logic [0:3] RF_W_wr, RF_Rp_rd, RF_Rq_rd;
    logic [0:1] RF_s, alu_s ;
    
    //Definição do componentes
    ControlUnit ControlUnit( clk, RF_Rp_zero,
                             data, addr,
                             rd, D_rd, D_wr,
                             RF_W_addr, RF_Rp_addr, RF_Rq_addr,
                             D_addr, RF_W_data,
                             RF_W_wr, RF_Rp_rd, RF_Rq_rd,
                             RF_s, alu_s );
    
    assign result = a + b - 1;
    
    //ligação dos sinais com as saídas
    
endmodule
