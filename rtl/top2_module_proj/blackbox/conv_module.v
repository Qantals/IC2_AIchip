`timescale 1ns/1ps
module conv_module (
    input clk,
    input rst_n,
    input in_vld,
    input [8*8*1*8-1:0] data_lin,
    input [3*3*3*8-1:0] weight_lin,

    output [6*6*3*8-1:0] conv_lin,
    output out_vld
);

    assign conv_lin = 0;
    assign out_vld = 0;

endmodule
