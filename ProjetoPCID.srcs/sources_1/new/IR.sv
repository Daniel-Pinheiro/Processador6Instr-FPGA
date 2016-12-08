
module IR(
    input clk,
    input logic load,
    input logic [15:0] data,
    output logic [15:0] inst );
    
    always @(posedge clk)
        if (load) inst <= data;
                       
endmodule
