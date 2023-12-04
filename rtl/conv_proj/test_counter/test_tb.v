`timescale 1ns/1ps
module test;

    reg clk;
    reg rst_n;
    reg in_valid;
    wire out_valid;

    conv_module u_conv_module(
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid),
        .out_valid(out_valid)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        in_valid = 0;
        #6;
        rst_n = 1;
        in_valid = 1;
    end
    
endmodule
