
module ALU(
input logic [15:0] a,
    input logic [15:0] b,
    input logic [1:0] s,
    output logic [15:0] out
    );
    
   
    always_comb
        case (s)
          2'b00: out = a;
          2'b01: out = a + b;
          2'b10: out = a - b;
        endcase
           
endmodule
