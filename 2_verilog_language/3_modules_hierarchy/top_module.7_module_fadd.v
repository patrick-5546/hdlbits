module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);  //

  wire [15:0] lower_sum, upper_sum;
  wire lower_cin, lower_cout, upper_cout;

  // ripple carry adders consisting of 16 add1 modules
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

// full adder
module add1 (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

  /*
  // full adder equations
  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (a & cin) | (b & cin);
  */

  // concatenation: right hand side is extended to match left
  // https://hdlbits.01xz.net/wiki/Vector3
  assign {cout, sum} = a + b + cin;

endmodule
