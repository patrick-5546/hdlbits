module top_module (
    input  [99:0] in,
    output [99:0] out
);

  always_comb begin : reverse
    // $bits() is a system function that returns the width of a signal
    // other systemverilog utilities: https://www.systemverilog.io/verification/ten-utilities/#:~:text=The%20%24bits()%20system%20function,as%20an%20elaboration%20time%20constant.
    for (int i = 0; i < $bits(out); i++) begin
      out[i] = in[$bits(out)-i-1];
    end
  end

endmodule
