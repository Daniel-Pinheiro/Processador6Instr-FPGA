
module IncPC(
    input logic [15:0] a,
    input logic [15:0] b,
    output logic [15:0] saida
    );
    
    assign saida = a + b - 1;
endmodule