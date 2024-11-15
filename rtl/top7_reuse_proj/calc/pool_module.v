`timescale 1ns/1ps
module pool_module (
    input clk,
    input rst_n,
    input in_vld,
    // input [$clog2(67)-1:0] cnt,
    input [$clog2(68)-1:0] cnt,
    input [7:0] conv_D1,
    input [7:0] conv_D2,
    input [7:0] conv_D3,

    output [3*8-1:0] pool_lin_D1,
    output [3*8-1:0] pool_lin_D2,
    output [3*8-1:0] pool_lin_D3
);

    reg [2:0]sel;
    always @(*) begin
        case (cnt)
            21,37,53: sel = 0;
            22,29,30, 38,45,46, 54,61,62: sel = 1;
            23,39,55: sel = 2;
            24,31,32, 40,47,48, 56,63,64: sel = 3;
            25,41,57: sel = 4;
            26,33,34, 42,49,50, 58,65,66: sel = 5;
            default: sel = 6;
        endcase
    end

    // calculate unit
    pool_2x2 u_pool_2x2_D1(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .sel(sel),
        .conv(conv_D1),
        .pool_lin_reg(pool_lin_D1)
    );
    pool_2x2 u_pool_2x2_D2(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .sel(sel),
        .conv(conv_D2),
        .pool_lin_reg(pool_lin_D2)
    );
    pool_2x2 u_pool_2x2_D3(
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .sel(sel),
        .conv(conv_D3),
        .pool_lin_reg(pool_lin_D3)
    );

endmodule
