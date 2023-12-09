`timescale 1ns/1ps
module connect_module (
    input clk,
    input rst_n,
    input in_vld,
    input [3*3*3*8-1:0] pool_lin,
    input [3*3*3*8-1:0] weight_lin,

    output [7:0] ans_reg,
    output out_vld
);

    assign ans_reg = 0;
    assign out_vld = 0;

endmodule
