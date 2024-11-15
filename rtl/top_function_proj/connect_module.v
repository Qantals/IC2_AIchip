`timescale 1ns/1ps
module connect_module (
    // input clk,
    // input rst_n,
    input [3*3*3*8-1:0] pool_lin,
    input [3*3*3*8-1:0] weight_lin,
    output [7:0] ans
);
    integer i;
    genvar r,c,d,j;


    // get dot product
    wire [3*3*3*16-1:0] dot_ans;
    generate
        for(d = 0; d <= 2; d = d + 1) begin:block_connect_dot8_9
            dot8_9 u_dot8_9(
                .data0(pool_lin[(d*9  )*8  +:8]),
                .data1(pool_lin[(d*9+1)*8 +: 8]),
                .data2(pool_lin[(d*9+2)*8 +: 8]),
                .data3(pool_lin[(d*9+3)*8 +: 8]),
                .data4(pool_lin[(d*9+4)*8 +: 8]),
                .data5(pool_lin[(d*9+5)*8 +: 8]),
                .data6(pool_lin[(d*9+6)*8 +: 8]),
                .data7(pool_lin[(d*9+7)*8 +: 8]),
                .data8(pool_lin[(d*9+8)*8 +: 8]),
                .weight0(weight_lin[(d*9  )*8 +: 8]),
                .weight1(weight_lin[(d*9+1)*8 +: 8]),
                .weight2(weight_lin[(d*9+2)*8 +: 8]),
                .weight3(weight_lin[(d*9+3)*8 +: 8]),
                .weight4(weight_lin[(d*9+4)*8 +: 8]),
                .weight5(weight_lin[(d*9+5)*8 +: 8]),
                .weight6(weight_lin[(d*9+6)*8 +: 8]),
                .weight7(weight_lin[(d*9+7)*8 +: 8]),
                .weight8(weight_lin[(d*9+8)*8 +: 8]),
                .dot0(dot_ans[(d*9  )*16 +: 16]),
                .dot1(dot_ans[(d*9+1)*16 +: 16]),
                .dot2(dot_ans[(d*9+2)*16 +: 16]),
                .dot3(dot_ans[(d*9+3)*16 +: 16]),
                .dot4(dot_ans[(d*9+4)*16 +: 16]),
                .dot5(dot_ans[(d*9+5)*16 +: 16]),
                .dot6(dot_ans[(d*9+6)*16 +: 16]),
                .dot7(dot_ans[(d*9+7)*16 +: 16]),
                .dot8(dot_ans[(d*9+8)*16 +: 16])
            );
        end
    endgenerate




    // signed expand width
    wire [3*3*3*21-1:0] expand_ans;
    generate
        for(j = 0; j <= 3*3*3-1; j = j + 1) begin:block_connect_expand21
            expand21 u_expand21(
                .dot(dot_ans[j*16 +: 16]),
                .expand(expand_ans[j*21 +: 21])
            );
        end
    endgenerate




    // get sum of 3*3*3->1*1*3
    wire [1*1*3*21-1:0] sum3_ans;
    generate
        for(j = 0; j <= 1*1*3-1; j = j + 1) begin:block_connect_sum21_9
            sum21_9 u_sum21_9(
                .expand0(expand_ans[(j*9  )*21 +: 21]),
                .expand1(expand_ans[(j*9+1)*21 +: 21]),
                .expand2(expand_ans[(j*9+2)*21 +: 21]),
                .expand3(expand_ans[(j*9+3)*21 +: 21]),
                .expand4(expand_ans[(j*9+4)*21 +: 21]),
                .expand5(expand_ans[(j*9+5)*21 +: 21]),
                .expand6(expand_ans[(j*9+6)*21 +: 21]),
                .expand7(expand_ans[(j*9+7)*21 +: 21]),
                .expand8(expand_ans[(j*9+8)*21 +: 21]),
                .sum(sum3_ans[j*21 +: 21])
            );
        end
    endgenerate

    // get connect of 1*1*3->1*1*1
    wire [21-1:0] sum1_ans;
    sum21_3 u_sum21_3(
        .expand0(sum3_ans[0*21 +: 21]),
        .expand1(sum3_ans[1*21 +: 21]),
        .expand2(sum3_ans[2*21 +: 21]),
        .sum(sum1_ans)
    );



    // compress every bit
    wire [7:0] compress_ans;
    compress13 u_compress13(
        .sum(sum1_ans[20:8]),
        .compress(compress_ans)
    );

    assign ans = compress_ans;

endmodule
