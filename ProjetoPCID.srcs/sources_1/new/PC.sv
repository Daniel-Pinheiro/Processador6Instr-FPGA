
module CounterPC(
    input logic clk,
    input logic pc_ld,
    input logic clr,
    input logic pc_inc,
    input logic [15:0] s,
    output logic [15:0] pc_addr );
    
    always @(posedge clr or posedge clk)
        if (clr) pc_addr <= 0;
            
            else if (pc_ld) 
                pc_addr <= s;
                
                    else if (pc_inc) 
                        pc_addr <= pc_addr + 1;
            
endmodule