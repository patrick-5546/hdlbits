module top_module (
    input  a,
    input  b,
    output out
);

  // truth table
  // a b | out
  // 0 0 | 1
  // 0 1 | 0
  // 1 0 | 0
  // 1 1 | 1
  assign out = ~(a ^ b);

endmodule
