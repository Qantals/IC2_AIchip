`timescale 1ns/1ps
module pool_module (
    input clk,
    input rst_n,
    input in_vld,
    input [6*6*3*8-1:0] conv_lin,

    output [3*3*3*8-1:0] pool_lin,
    output out_vld
);

    assign pool_lin = 0;
    assign out_vld = 0;

endmodule
