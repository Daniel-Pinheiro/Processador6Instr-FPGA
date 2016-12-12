
module tb_ContrUnit( );

    logic       clk,reset, RF_Rp_zero;
    logic [0:15] I_data;
    logic [0:15] I_addr;
    logic       I_rd, D_rd, D_wr;
    logic [0:3] RF_W_addr, RF_Rp_addr, RF_Rq_addr;
    logic [0:7] D_addr, RF_W_data;
    logic       RF_W_wr, RF_Rp_rd, RF_Rq_rd;
    logic [0:1] RF_s, alu_s;

    ControlUnit simu( clk,reset, RF_Rp_zero,
                      I_data,
                      I_addr,
                      I_rd, D_rd, D_wr,
                      D_addr, RF_W_data,
                      RF_W_wr, RF_Rp_rd, RF_Rq_rd,
                      RF_W_addr, RF_Rp_addr, RF_Rq_addr,
                      RF_s, alu_s );
    
    always
        begin
        clk=1; #5;  clk=0; #5;
        end
    
    initial begin
        RF_Rp_zero = 1;
        reset = 1;#20
        reset = 0;
        I_data= {4'b011, 4'b0100, 8'b00001111}; #40;
        I_data= {4'b011, 4'b1000, 8'b01111000}; #30;
        
        I_data= {4'b010, 4'b0001, 4'b1000, 4'b0100}; #30;
        I_data= {4'b100, 4'b0000, 4'b1000, 4'b0001}; #30;
        
        I_data= {4'b000, 4'b0100, 8'b00001111}; #30;
        I_data= {4'b000, 4'b1000, 8'b01111000}; #30;
        I_data= {4'b001, 4'b0100, 8'b00001111}; #30;
        I_data= {4'b001, 4'b1000, 8'b01111000}; #30;
        
        I_data= {4'b101, 4'b0000, 8'b00001001}; #100;
        RF_Rp_zero = 0;
        I_data= {4'b111, 4'b0000, 8'b01000100}; #100;
    end
endmodule
