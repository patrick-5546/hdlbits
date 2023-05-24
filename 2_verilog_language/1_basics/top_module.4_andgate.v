module top_module (
    input  a,
    input  b,
    output out
);

  // bitwise-AND: &
  // logical-AND: &&
  assign out = a & b;

endmodule
