// carry select adder
module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

  wire [15:0] lower_sum, upper_sum0, upper_sum1, upper_sum;
  wire lower_cin, lower_cout, upper_cin0, upper_cout0, upper_cin1, upper_cout1;

  add16 lower_half (
      .a(a[15:0]),
      .b(b[15:0]),
      .cin(lower_cin),
      .sum(lower_sum),
      .cout(lower_cout)
  );
  add16 upper_half0 (
      .a(a[31:16]),
      .b(b[31:16]),
      .cin(upper_cin0),
      .sum(upper_sum0),
      .cout(upper_cout0)
  );
  add16 upper_half1 (
      .a(a[31:16]),
      .b(b[31:16]),
      .cin(upper_cin1),
      .sum(upper_sum1),
      .cout(upper_cout1)
  );

  assign lower_cin = 1'b0;
  assign upper_cin0 = 1'b0;
  assign upper_cin1 = 1'b1;
  assign upper_sum = lower_cout ? upper_sum1 : upper_sum0;
  assign sum = {upper_sum, lower_sum};

endmodule
