
module alu(
    input logic [15:0] a,
    input logic [15:0] b,
    input logic [1:0] s,
    output logic [15:0] out
    );
    
   
    always_comb
        case (s)
         1:       out <= a + b;
         2:       out <= a - b;
         3:       out <= (b[5] == 0) ? (a << b[4:0]) : (a >> b[4:0]);
         default: out <= a;
        endcase
           
endmodule