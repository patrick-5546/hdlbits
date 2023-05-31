module top_module (
    input  ring,
    input  vibrate_mode,
    output ringer,        // Make sound
    output motor          // Vibrate
);

  // attempt 1
  // room for improvement: raw number present
  // assign ringer = vibrate_mode ? 1'b0 : ring;
  // assign motor  = vibrate_mode ? ring : 1'b0;

  assign ringer = ring & ~vibrate_mode;
  assign motor  = ring & vibrate_mode;

endmodule
