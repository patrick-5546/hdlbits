module top_module (
    input [399:0] a,
    b,
    input cin,
    output cout,
    output [399:0] sum
);

  // BCD: binary-coded decimal
  // - where each digit is represented by a fixed number of bits
  wire [100:0] carry;

  assign carry[0] = cin;
  assign cout = carry[100];

  // Advanced module instantiation
  // - array instantiation format: module_name instance_name [top_index
  //   : bottom_index] (.port_name(array or concatenation of signals), ...);
  // - generate blocks: more powerful, allow procedural statements like `for`
  // - ref: http://www.eecs.umich.edu/courses/eecs470/OLD/w14/labs/lab6_ex/AMI.pdf
  bcd_fadd bcd_fadd_100[99:0] (
      .a(a),
      .b(b),
      .cin(carry[99:0]),
      .cout(carry[100:1]),
      .sum(sum)
  );

endmodule
