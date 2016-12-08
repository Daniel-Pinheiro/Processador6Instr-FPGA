
module RAM(
                input logic [0:15] W_data,
                input logic [0:7] addr,
                input logic wr,
                input logic rd,
                input logic [0:7]chaves,
                input logic clk,
                output logic [0:7]leds,
                output logic [0:15] R_data );

    logic [0:15] mem[246:0];
    logic [0:7]  m_leds;

    //gerando as células de memória
    integer k;
    initial begin
        for (k = 0; k < 246 ; k = k + 1)
            mem[k] = 16'h00;
        m_leds = 0;
    end
    
    always_ff @(posedge clk)
        if (wr)
            if(addr < 240 )
                mem[addr] <= W_data;
            else if(addr > 247)
                m_leds[addr-248] <= W_data[0];
            
        else if (rd)
            if(addr < 240 )
                R_data <= mem[addr];
            else if(addr > 247)
                R_data <= {15'b0, m_leds[addr-248]};
            else
                R_data <= {15'b0, chaves[addr-240]};

    //definindo os leds
    genvar i;
    generate
      for (i = 0; i < 8 ; i = i + 1)
      begin: pin_leds
         assign leds[i] = m_leds[i];
      end
    endgenerate

endmodule