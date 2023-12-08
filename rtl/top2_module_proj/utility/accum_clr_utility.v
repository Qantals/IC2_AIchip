`timescale 1ns/1ps
module accum_clr_utility (
    input [3:0] cnt,
    output accum_clr
);

    assign accum_clr = (cnt == 0);

endmodule
