module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

  wire [15:0] lower_sum, upper_sum;
  wire lower_cin, lower_cout, upper_cout;

  add16 lower_half (
      .a(a[15:0]),
      .b(b[15:0]),
      .cin(lower_cin),
      .sum(lower_sum),
      .cout(lower_cout)
  );
  add16 upper_half (
      .a(a[31:16]),
      .b(b[31:16]),
      .cin(lower_cout),
      .sum(upper_sum),
      .cout(upper_cout)
  );

  assign lower_cin = 1'b0;
  assign sum = {upper_sum, lower_sum};

endmodule
