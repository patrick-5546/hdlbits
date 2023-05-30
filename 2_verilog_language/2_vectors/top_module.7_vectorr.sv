module top_module (
    input  [7:0] in,
    output [7:0] out
);

  always_comb begin
    for (int i = 0; i <= 7; i++) begin
      out[i] = in[7-i];
    end
  end

  /*
  // Using a generate-for loop
  // Notes:
  // - Quartus requires a generate-for loop to have a named begin-end block attached
  // - Use generate statements over for loop when there are module instantiations
  generate
    genvar i;
    for (i = 0; i <= 7; i = i + 1) begin : g_vectorr
      assign out[i] = in[7-i];
    end
  endgenerate
  */

endmodule
