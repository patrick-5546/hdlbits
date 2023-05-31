module top_module (
    input  [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different
);

  // attempt 1
  // room for improvement: bits more compilcated and verbose than vectors
  // - use vectors over for loops whenever possible
  // always_comb begin : gatesv
  //   for (int i = 0; i < $bits(in); i++) begin
  //     if (i < $bits(in) - 1) out_both[i] = in[i] & in[i+1];
  //     if (i > 0) out_any[i] = in[i] | in[i-1];
  //     out_different[i] = in[i] ^ ((i == $bits(in) - 1) ? in[0] : in[i+1]);
  //   end
  // end

  assign out_both = in[98:0] & in[99:1];
  assign out_any = in[99:1] | in[98:0];
  assign out_different = in ^ {in[0], in[99:1]};

endmodule
