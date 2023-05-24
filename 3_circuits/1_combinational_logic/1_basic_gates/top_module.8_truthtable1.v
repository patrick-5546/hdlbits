module top_module (
    input  x3,
    input  x2,
    input  x1,  // three inputs
    output f    // one output
);

  // sum of products form
  assign f = (~x3 & x2 & ~x1) | (~x3 & x2 & x1) | (x3 & ~x2 & x1) | (x3 & x2 & x1);

  // can be simplified by boolean algebra or kmap
  // assign f = (~x3 & x2) | (x3 & x1);

  // is a 2:1 mux
  // assign f = x3 ? x1 : x2;

endmodule
