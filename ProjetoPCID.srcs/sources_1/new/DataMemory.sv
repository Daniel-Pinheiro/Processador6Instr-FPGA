
module RAM(
                input logic [0:15] W_data,
                input logic [0:7] addr,
                input logic wr,
                input logic rd,
                input logic [0:7]chaves,
                input logic clk,
                output logic [0:7]leds,
                output logic [0:15] R_data );

    logic [0:15] mem[255:0];
    logic [0:7] d;

    interger k;
    initial
        for (k = 0; k < 255 ; k = k + 1)
            mem[k] = 16'h00;

    always_ff @(posedge clk)
            if (wr) mem[addr] <= W_data;
            else if (rd) R_data <= mem[addr];


            //definindo as chaves
    always_ff @(posedge clk)
        for (k = 0; k < 7 ; k = k + 1)
            mem[k+240][0] = chaves[k];

    assign d=8'b0;

    assign mem[239] =
{d,chaves[7],chaves[6],chaves[5],chaves[4],chaves[3],chaves[2],chaves[1],chaves[0]};

        //definindo os leds
    assign mem[248][0] = leds[0];
    assign mem[249][0] = leds[1];
    assign mem[250][0] = leds[2];
    assign mem[251][0] = leds[3];
    assign mem[252][0] = leds[4];
    assign mem[253][0] = leds[5];
    assign mem[254][0] = leds[6];
    assign mem[255][0] = leds[7];

endmodule