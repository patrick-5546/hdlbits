// synthesis verilog_input_version verilog_2001
// systemverilog-only syntax does not synthesize because of above line, so
// may need to waive lint errors
module top_module (
    input [2:0] sel,
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out
);  //

  // verilog_lint: waive always-comb
  always @(*) begin  // This is a combinational circuit
    // notes on case statements:
    // - duplicate/partially overlapping case items are permitted
    //   - the first one the matches is used
    // - if all cases are specified, make default case `{n{1'bx'}}`
    case (sel)
      3'h0: out = data0;
      3'h1: out = data1;
      3'h2: out = data2;
      3'h3: out = data3;
      3'h4: out = data4;
      3'h5: out = data5;
      default: out = 4'h0;
    endcase
  end

endmodule
