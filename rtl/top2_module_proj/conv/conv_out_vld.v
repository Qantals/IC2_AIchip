`timescale 1ns/1ps
module conv_out_vld (
    input clk,
    input rst_n,
    input out_vld_3x3,
    input out_vld_rc,
    output reg out_vld
);

    // They are the same in function, but may express more clearly.

    // always @(posedge clk, negedge rst_n) begin
    //     if(~rst_n)
    //         out_vld <= 0;
    //     else if(out_vld_rc && out_vld_3x3)
    //         out_vld <= 1;
    //     else
    //         out_vld <= 0;
    // end

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            out_vld <= 0;
        else
            out_vld <= (out_vld_rc & out_vld_3x3);
    end

endmodule
