module top_module (
    input clk,
    input [7:0] d,
    input [1:0] sel,
    output [7:0] q
);

  wire [7:0] q1, q2, q3;

  my_dff8 inst1 (
      .clk(clk),
      .d  (d),
      .q  (q1)
  );
  my_dff8 inst2 (
      .clk(clk),
      .d  (q1),
      .q  (q2)
  );
  my_dff8 inst3 (
      .clk(clk),
      .d  (q2),
      .q  (q3)
  );

  always_comb begin : four_to_one_mux
    case (sel)
      2'h0: q = d;
      2'h1: q = q1;
      2'h2: q = q2;
      2'h3: q = q3;
      default: q = {8{1'bx}};
    endcase
  end

endmodule
