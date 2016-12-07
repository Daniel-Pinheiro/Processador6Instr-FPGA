
module ROM( input            rd,
            input     [0:15] addr,
           output reg [0:15] data );

   always_comb
      if (rd)
         case (addr)
                00: data <= {4'b011, 4'b0100, 8'b00001111};
                01: data <= {4'b011, 4'b1000, 8'b01111000};
                
                02: data <= {4'b010, 4'b0001, 4'b1000, 4'b0100};
                03: data <= {4'b100, 4'b0000, 4'b1000, 4'b0001};
                
                04: data <= {4'b000, 4'b0100, 8'b00001111};
                06: data <= {4'b000, 4'b1000, 8'b01111000};
                07: data <= {4'b001, 4'b0100, 8'b00001111};
                08: data <= {4'b001, 4'b1000, 8'b01111000};
                
                09: data <= {4'b101, 4'b0000, 8'b00001001};
           default: data <= {4'b111, 4'b1111, 8'b11111111};
         endcase
     else data <= 'bz;
endmodule
