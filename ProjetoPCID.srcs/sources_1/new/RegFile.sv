module RegFile(
    input logic clk,
    input logic W_wr, Rp_rd, Rq_rd,
    input logic [3:0] W_addr, Rp_addr, Rq_addr,
    input logic [15:0] W_data,
    output logic [15:0] Rp_data, Rq_data );

    logic [15:0] Register [15:0];

//    always_comb begin
//      if (Rp_rd) Rp_data <= Register[Rp_addr];
//      else       Rp_data <= 'bz;

//      if (Rq_rd) Rq_data <= Register[Rq_addr];
//      else       Rq_data <= 'bz;
//    end

//    always_ff @(posedge Rp_rd)
//        Rp_data <= Register[Rp_addr];

//    always_ff @(posedge Rq_rd)
//        Rq_data <= Register[Rq_addr];

    always_ff @(posedge clk)//@(negedge clk)
        if (W_wr) Register[W_addr] <= W_data;

    assign Rp_data = Rp_rd ? Register[Rp_addr] : 'bz;
    assign Rq_data = Rq_rd ? Register[Rq_addr] : 'bz;
endmodule