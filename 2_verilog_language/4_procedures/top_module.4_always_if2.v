// synthesis verilog_input_version verilog_2001
// systemverilog-only syntax does not synthesize because of above line, so
// may need to waive lint errors
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving
);  //

  // latch: when not all possibilities are specified, output is unchanged,
  // so current state must be remembered -> inferring latches warning

  // verilog_lint: waive always-comb
  always @(*) begin
    if (cpu_overheated) shut_off_computer = 1;
    else shut_off_computer = 0;
  end

  // verilog_lint: waive always-comb
  always @(*) begin
    if (~arrived) keep_driving = ~gas_tank_empty;
    else keep_driving = 0;
  end

endmodule
