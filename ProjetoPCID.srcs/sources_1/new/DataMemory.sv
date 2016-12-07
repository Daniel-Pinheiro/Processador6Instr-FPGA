
module DataMemory(
                input logic [15:0] W_data,
                input logic [7:0] addr,
                input logic wr,
                input logic rd,
                input logic [7:0]chaves,
                input logic clk,
                output logic [7:0]leds,
                output logic [15:0] R_data );

    logic [15:0] mem[255:0];
    logic [7:0] d;

    always @(posedge clk)
            if (wr) mem[addr] <= W_data;
            else if (rd) R_data <= mem[addr];


            //definindo as chaves
    assign mem[240] = chaves[0];
    assign mem[241] = chaves[1];
    assign mem[242] = chaves[2];
    assign mem[243] = chaves[3];
    assign mem[244] = chaves[4];
    assign mem[245] = chaves[5];
    assign mem[246] = chaves[6];
    assign mem[247] = chaves[7];

    assign d=8'b0;

    assign mem[239] =
{d,chaves[7],chaves[6],chaves[5],chaves[4],chaves[3],chaves[2],chaves[1],chaves[0]};

        //definindo os leds
    assign mem[248] = leds[0];
    assign mem[249] = leds[1];
    assign mem[250] = leds[2];
    assign mem[251] = leds[3];
    assign mem[252] = leds[4];
    assign mem[253] = leds[5];
    assign mem[254] = leds[6];
    assign mem[255] = leds[7];

endmodule