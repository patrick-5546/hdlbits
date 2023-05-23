module top_module (
    input  a,
    input  b,
    output out
);

  // bitwise-OR: |
  // logical-OR: ||
  assign out = ~(a | b);

endmodule
