
module FSM( input       clk, RF_Rp_zero,
            input[0:15] IR_data,
           output       PC_ld, PC_clr, PC_inc,
           output       I_rd, IR_ld,
           output       D_rd, D_wr,
           output [0:3] RF_W_addr, RF_Rp_addr, RF_Rq_addr,
           output [0:7] D_addr, RF_W_data,
           output [0:3] RF_W_wr, RF_Rp_rd, RF_Rq_rd,
           output [0:1] RF_s, alu_s );

    //Algumas definições de pseudonimos de alguns bits da entrada
    wire[0:3] op;       assign op = IR_data[0:3];
    wire[0:3] ra;       assign ra = IR_data[4:7];
    wire[0:3] rb;       assign rb = IR_data[8:11];
    wire[0:3] rc;       assign rc = IR_data[12:15];
    wire[0:7] d;        assign  d = IR_data[8:15];
    
    //Definição dos estados da FSM
    typedef enum logic[3:0] {start, fetch, decode,
        load, loadconst, store, add, subtract, jump, jumpiz} statetype;
    statetype  state, nextstate;
    
    always_ff @(posedge clk)    state <= nextstate;
    
    //Definição das transições de estado
    always_comb
        case( state )
            start:                  nextstate = fetch;
            fetch:                  nextstate = decode;
            decode:     case( op )
                        'b000:      nextstate = load;
                        'b001:      nextstate = store;
                        'b010:      nextstate = add;
                        'b011:      nextstate = loadconst;
                        'b100:      nextstate = subtract;
                        'b101:      nextstate = jump;
                        default:    nextstate = start;
                        endcase
            load:                   nextstate = fetch;
            loadconst:              nextstate = fetch;
            store:                  nextstate = fetch;
            add:                    nextstate = fetch;
            subtract:               nextstate = fetch;
            jumpiz:  if(RF_Rp_zero) nextstate = jump;
                     else           nextstate = fetch;
            jump:                   nextstate = fetch;
            default:                nextstate = start;
        endcase
    
    //Saídas dependentes dos estado
    assign PC_clr = ( state == start );
    assign PC_ld = ( state == jump );
    assign PC_inc = ( state == fetch );
    
    assign I_rd = ( state == fetch );
    assign IR_ld = ( state == fetch );
    
    assign D_rd = ( state == load );
    assign D_wr = ( state == store );
    assign D_addr = ( state == load || state == store ) ? d : 0;
    
    assign RF_W_wr = ( state == load || state == add || state == subtract || state == loadconst );
    assign RF_W_addr = ( state == load || state == add || state == subtract || state == loadconst ) ? ra : 0;
    assign RF_W_data = IR_data[8:15];
    
    assign RF_Rp_rd = ( state == store || state == jumpiz || state == add || state == subtract );
    assign RF_Rp_addr = ( state == store || state == jumpiz ) ? ra : ( state == add || state == subtract ) ? rb : 0;
    
    assign RF_Rq_rd = ( state == add || state == subtract );
    assign RF_Rq_addr = ( state == add || state == subtract ) ? rc : 0;
    
    assign RF_s = ( state == load ) ? 1 : ( state == loadconst ) ? 2 : ( state == add || state == subtract ) ? 0 : 3;
    assign alu_s = ( state == add ) ? 1 : ( state == subtract ) ? 2 : 0;

endmodule
