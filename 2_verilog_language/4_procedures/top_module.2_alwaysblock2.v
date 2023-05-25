// synthesis verilog_input_version verilog_2001
// systemverilog-only syntax does not synthesize because of above line, so
// may need to waive lint errors
module top_module (
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff
);

  // continuous assignment
  assign out_assign = a ^ b;

  // verilog_lint: waive always-comb
  always @(*) begin
    // use procedural blocking assignment in combinational always blocks
    out_always_comb = a ^ b;
  end

  always @(posedge clk) begin
    // use procedural non-blocking assignment in clocked always blocks
    out_always_ff <= a ^ b;
  end

endmodule
