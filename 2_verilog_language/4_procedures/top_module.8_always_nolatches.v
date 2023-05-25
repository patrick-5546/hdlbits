// synthesis verilog_input_version verilog_2001
// systemverilog-only syntax does not synthesize because of above line, so
// may need to waive lint errors
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up
);

  // verilog_lint: waive always-comb
  always @(*) begin
    // to avoid creating latches while minimizing typing,
    // assign a default value to the outputs before the case statement
    left = 1'b0;
    down = 1'b0;
    right = 1'b0;
    up = 1'b0;

    case (scancode)
      16'he06b: left = 1'b1;
      16'he072: down = 1'b1;
      16'he074: right = 1'b1;
      16'he075: up = 1'b1;
      // default case is empty because default values assigned above
      default:  ;  // make empty default case to fix lint error / synthesis warning
    endcase
  end

endmodule
