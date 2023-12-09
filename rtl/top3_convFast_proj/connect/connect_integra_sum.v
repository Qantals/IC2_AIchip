`timescale 1ns/1ps
module connect_integra_sum (
    input signed [20:0] ans_D1,
    input signed [20:0] ans_D2,
    input signed [20:0] ans_D3,
    output signed [20:0] sum_all
);

    assign sum_all = ans_D1 + ans_D2 + ans_D3;

endmodule
