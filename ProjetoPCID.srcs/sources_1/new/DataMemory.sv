
module RAM(
                input logic [15:0] W_data,
                input logic [7:0] addr,
                input logic wr,
                input logic rd,
                input logic [7:0]chaves,
                input logic clk,
                output logic [7:0]leds,
                output logic [15:0] R_data );

    //gerando as células de memória
    logic [15:0] mem[246:0];
    logic [7:0]  m_leds;

    integer k;
    initial begin
        for (k = 0; k < 247 ; k = k + 1)
            mem[k] = 16'h00;
        for (k = 0; k < 8 ; k = k + 1)
            m_leds[k] = 0;
    end
    
    always_ff @(posedge clk) begin
        if (wr)
            case( addr )
                248:      m_leds[0] = W_data[0];
                249:      m_leds[1] = W_data[0];
                250:      m_leds[2] = W_data[0];
                251:      m_leds[3] = W_data[0];
                252:      m_leds[4] = W_data[0];
                253:      m_leds[5] = W_data[0];
                254:      m_leds[6] = W_data[0];
                255:      m_leds[7] = W_data[0];
                default:  mem[addr] = W_data;
                endcase
            
        if (rd)
            if(addr < 240 )
                R_data <= mem[addr];
            else if(addr > 247)
                R_data <= {15'b0, m_leds[addr-248]};
            else
                R_data <= {15'b0, chaves[addr-240]};
    
        leds <= m_leds;
    end
    
endmodule