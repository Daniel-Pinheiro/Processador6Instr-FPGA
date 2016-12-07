
module alu(
    input logic [15:0] a,
    input logic [15:0] b,
    input logic   s0,s1,
    output logic [15:0] out
    );
    
   
    always_comb
        if (s1) out = a - b;
            else if (s0) out = a + b;
                else out = a;
        //case (s)
         //2'b00: out = a;
         //2'b01: out = a + b;
         //2'b10: out = a - b;
        //endcase
           
endmodule