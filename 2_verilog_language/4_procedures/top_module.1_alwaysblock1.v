// synthesis verilog_input_version verilog_2001
// systemverilog-only syntax does not synthesize because of above line, so
// may need to waive lint errors
module top_module (
    input a,
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);

  // LHS of assign statement must be a net type (e.g., `wire``)
  // net: physical connection between physical entities; does not store value
  assign out_assign = a & b;

  // verilog_lint: waive always-comb
  always @(*) begin
    // LHS of procedural statement must be variable net type (e.g., `reg``)
    // // variable: used to store values
    out_alwaysblock = a & b;
  end

endmodule
