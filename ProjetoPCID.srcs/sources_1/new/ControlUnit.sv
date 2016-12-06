
module ControlUnit( input       clk, RF_Rp_zero,
                    input [0:15] data,
                   output [0:15] addr,
                   output       rd, D_rd, D_wr,
                   output       RF_W_addr, RF_Rp_addr, RF_Rq_addr,
                   output [0:7] D_addr, RF_W_data,
                   output [0:3] RF_W_wr, RF_Rp_rd, RF_Rq_rd,
                   output [0:1] RF_s, alu_s );

    //Definição dos sinais dos componentes
    logic[0:15] IR_data;
    logic       PC_ld, PC_clr, PC_inc;
    logic       I_rd, IR_ld, _D_rd, _D_wr;
    logic       _RF_Rp_zero, _RF_W_addr, _RF_Rp_addr, _RF_Rq_addr;
    logic [0:7] _D_addr, _RF_W_data;
    logic [0:3] _RF_W_wr, _RF_Rp_rd, _RF_Rq_rd;
    logic [0:1] _RF_s, _alu_s ;
    
    //Definição do componentes
    FSM ControlBlock( clk, _RF_Rp_zero, IR_data,
                      PC_ld, PC_clr, PC_inc,
                      I_rd, IR_ld, _D_rd, _D_wr,
                      _RF_W_addr, _RF_Rp_addr, _RF_Rq_addr,
                      _D_addr, _RF_W_data,
                      _RF_W_wr, _RF_Rp_rd, _RF_Rq_rd,
                      _RF_s, _alu_s );
    
    //ligação dos sinais com as saídas
    assign D_rd = _D_rd;
    assign D_wr = _D_wr;
    assign RF_Rp_zero = _RF_Rp_zero;
    assign RF_W_addr = _RF_W_addr;
    assign RF_Rp_addr = _RF_Rp_addr;
    assign RF_Rq_addr = _RF_Rq_addr;
    assign D_addr = _D_addr;
    assign RF_W_data = _RF_W_data;
    assign RF_W_wr = _RF_W_wr;
    assign RF_Rp_rd = _RF_Rp_rd;
    assign RF_Rq_rd = _RF_Rq_rd;
    assign RF_s = _RF_s;
    assign alu_s = _alu_s;
    
endmodule