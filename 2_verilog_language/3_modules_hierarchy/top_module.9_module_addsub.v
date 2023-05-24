// adder-subtractor subtracts if sub is high else adds
module top_module (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

  wire [31:0] b_actual;
  wire [15:0] lower_sum, upper_sum;
  wire lower_cout, upper_cout;

  add16 lower_half (
      .a(a[15:0]),
      .b(b_actual[15:0]),
      .cin(sub),
      .sum(lower_sum),
      .cout(lower_cout)
  );
  add16 upper_half (
      .a(a[31:16]),
      .b(b_actual[31:16]),
      .cin(lower_cout),
      .sum(upper_sum),
      .cout(upper_cout)
  );

  // assign b_actual = b ^ {32{sub}};  // worse implementation than line below
  assign b_actual = sub ? ~b : b;
  assign sum = {upper_sum, lower_sum};

endmodule
