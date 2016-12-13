module RegFile(
    input logic clk,
    input logic W_wr, Rp_rd, Rq_rd,
    input logic [3:0] W_addr, Rp_addr, Rq_addr,
    input logic [15:0] W_data,
    output logic [15:0] Rp_data, Rq_data );

    logic [15:0] Register [15:0];

      always_ff @(posedge clk) begin
          if (W_wr) Register[W_addr] <= W_data;
          if (Rp_rd) Rp_data <= Register[Rp_addr];
          if (Rq_rd) Rq_data <= Register[Rq_addr];
      end
endmodule