module top_module (
    input [99:0] a,
    b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);

  full_adder lsb (
      .a(a[0]),
      .b(b[0]),
      .cin(cin),
      .cout(cout[0]),
      .sum(sum[0])
  );

  generate
    genvar i;
    for (i = 1; i < $bits(a); i++) begin : g_vectorr
      full_adder bite (
          .a(a[i]),
          .b(b[i]),
          .cin(cout[i-1]),
          .cout(cout[i]),
          .sum(sum[i])
      );
    end
  endgenerate

endmodule

module full_adder (
    input  a,
    b,
    input  cin,
    output cout,
    output sum
);

  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (a & cin) | (b & cin);

endmodule
