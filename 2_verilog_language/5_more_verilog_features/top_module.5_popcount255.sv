module top_module (
    input  [254:0] in,
    output [  7:0] out
);

  always_comb begin : count_ones
    out = 8'h00;
    for (int i = 0; i < $bits(in); i++) begin
      // in software would use if statements, but in hardware
      // that would be more gates
      out += in[i];
    end
  end

endmodule
