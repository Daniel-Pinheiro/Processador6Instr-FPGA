
module mux(
    input logic [15:0] d0,
    input logic [15:0] d1,
    input logic [7:0] d2,
    input logic s0,s1,
    output logic [15:0] y 
    );
    
    
    //assign y = s1  ? d2 : ( s0 ? d1 : {d, d0[7:0]} );
    assign y = s1  ? {8'b0,d2[7:0]} : ( s0 ? d1 :  d0 );
endmodule