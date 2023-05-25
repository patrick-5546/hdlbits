// synthesis verilog_input_version verilog_2001
// systemverilog-only syntax does not synthesize because of above line, so
// may need to waive lint errors
module top_module (
    input [3:0] in,
    output reg [1:0] pos
);

  // priority encoder: outputs position of the first (left-most)
  // 1 bit in a vector
  // verilog_lint: waive always-comb
  always @(*) begin
    case (in)
      4'h0: pos = 2'h0;
      4'h1: pos = 2'h0;
      4'h2: pos = 2'h1;
      4'h3: pos = 2'h0;
      4'h4: pos = 2'h2;
      4'h5: pos = 2'h0;
      4'h6: pos = 2'h1;
      4'h7: pos = 2'h0;
      4'h8: pos = 2'h3;
      4'h9: pos = 2'h0;
      4'ha: pos = 2'h1;
      4'hb: pos = 2'h0;
      4'hc: pos = 2'h2;
      4'hd: pos = 2'h0;
      4'he: pos = 2'h1;
      4'hf: pos = 2'h0;
      default: pos = {2{1'bx}};
    endcase
  end

endmodule
