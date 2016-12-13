
module mux(
        input logic [15:0] d0,
        input logic [15:0] d1,
        input logic [7:0] d2,
        input logic [1:0] s,
        output logic [15:0] y );
    
    always_comb
        case( s )
            1:        y = d1;
            2:        y = d2;
            default:  y = d0;
        endcase
endmodule