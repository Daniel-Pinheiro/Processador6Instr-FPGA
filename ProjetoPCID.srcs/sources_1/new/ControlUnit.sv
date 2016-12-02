
module ControlUnit( input       clk, RF_Rp_zero,
                    input[0:15] IR_data,
                   output       PC_ld, PC_clr, PC_inc,
                   output       I_rd, IR_ld, D_rd, D_wr,
                   output       RF_W_addr, RF_Rp_addr, RF_Rq_addr,
                   output [0:7] D_addr, RF_W_data,
                   output [0:3] RF_W_wr, RF_Rp_rd, RF_Rq_rd,
                   output [0:1] RF_s, alu_s );

    wire[0:3] op;   assign op = IR_data[0:3];
    
    typedef enum logic[3:0] {start, fetch, decode,
        load, loadconst, store, add, subtract, jump, jumpiz} statetype;
    statetype  state, nextstate;
    
    always_ff @(posedge clk)    state <= nextstate;
    
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

    assign PC_clr = ( state == start );

endmodule
