`timescale 1ns/1ps
module connect3x3 (
    input clk,
    input rst_n,
    input [3:0] cnt,

    input signed [7:0] data0,
    input signed [7:0] data1,
    input signed [7:0] data2,
    input signed [7:0] data3,
    input signed [7:0] data4,
    input signed [7:0] data5,
    input signed [7:0] data6,
    input signed [7:0] data7,
    input signed [7:0] data8,

    input signed [7:0] weight0,
    input signed [7:0] weight1,
    input signed [7:0] weight2,
    input signed [7:0] weight3,
    input signed [7:0] weight4,
    input signed [7:0] weight5,
    input signed [7:0] weight6,
    input signed [7:0] weight7,
    input signed [7:0] weight8,

    output signed [20:0] ans
);

    reg signed [7:0] mul1,mul2;
    always @(*) begin
        case (cnt)
            0: begin mul1 = data0; mul2 = weight0; end
            1: begin mul1 = data1; mul2 = weight1; end
            2: begin mul1 = data2; mul2 = weight2; end
            3: begin mul1 = data3; mul2 = weight3; end
            4: begin mul1 = data4; mul2 = weight4; end
            5: begin mul1 = data5; mul2 = weight5; end
            6: begin mul1 = data6; mul2 = weight6; end
            7: begin mul1 = data7; mul2 = weight7; end
            8: begin mul1 = data8; mul2 = weight8; end
            9: begin mul1 = 0;     mul2 = 0;       end
            default: begin mul1 = 0; mul2 = 0;     end
        endcase
    end
    wire signed [15:0] product;
    assign product = mul1 * mul2;


    reg signed [20:0] sum_accum;
    wire signed [20:0] nxt_sum;
    assign nxt_sum = (cnt == 0) ? (0 + product) : (sum_accum + product);
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            sum_accum <= 0;
        else
            sum_accum <= nxt_sum;
    end

    // assign ans = ($signed(sum_accum[19:8]) > 127) ? 8'd127 : (($signed(sum_accum[19:8]) < -128) ? -8'd128 : $signed(sum_accum[15:8]));
    assign ans = sum_accum;

endmodule