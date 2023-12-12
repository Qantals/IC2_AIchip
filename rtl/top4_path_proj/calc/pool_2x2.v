`timescale 1ns/1ps
module pool_2x2(
    input clk,
    input rst_n,
    // input [$clog2(67)-1:0] cnt,
    input [$clog2(69)-1:0] cnt,
    input signed [7:0] conv,

    output [3*3*8-1:0] pool_lin_reg
);

    reg signed [7:0] data0,data1,data2,data3,data4,data5,data6,data7,data8;
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) begin
            data0 <= 0; data1 <= 0; data2 <= 0;
            data3 <= 0; data4 <= 0; data5 <= 0;
            data6 <= 0; data7 <= 0; data8 <= 0;
        end
        else begin
            case (cnt)
                // 20: data0 <= conv;
                // 21,28,29: data0 <= (conv > data0) ? conv : data0;
                // 22: data1 <= conv;
                // 23,30,31: data1 <= (conv > data1) ? conv : data1;
                // 24: data2 <= conv;
                // 25,32,33: data2 <= (conv > data2) ? conv : data2;
                // 36: data3 <= conv;
                // 37,44,45: data3 <= (conv > data3) ? conv : data3;
                // 38: data4 <= conv;
                // 39,46,47: data4 <= (conv > data4) ? conv : data4;
                // 40: data5 <= conv;
                // 41,48,49: data5 <= (conv > data5) ? conv : data5;
                // 52: data6 <= conv;
                // 53,60,61: data6 <= (conv > data6) ? conv : data6;
                // 54: data7 <= conv;
                // 55,62,63: data7 <= (conv > data7) ? conv : data7;
                // 56: data8 <= conv;
                // 57,64,65: data8 <= (conv > data8) ? conv : data8;
                21: data0 <= conv;
                22,29,30: data0 <= (conv > data0) ? conv : data0;
                23: data1 <= conv;
                24,31,32: data1 <= (conv > data1) ? conv : data1;
                25: data2 <= conv;
                26,33,34: data2 <= (conv > data2) ? conv : data2;
                37: data3 <= conv;
                38,45,46: data3 <= (conv > data3) ? conv : data3;
                39: data4 <= conv;
                40,47,48: data4 <= (conv > data4) ? conv : data4;
                41: data5 <= conv;
                42,49,50: data5 <= (conv > data5) ? conv : data5;
                53: data6 <= conv;
                54,61,62: data6 <= (conv > data6) ? conv : data6;
                55: data7 <= conv;
                56,63,64: data7 <= (conv > data7) ? conv : data7;
                57: data8 <= conv;
                58,65,66: data8 <= (conv > data8) ? conv : data8;
                // default: 
            endcase
        end
    end

    assign pool_lin_reg[0*8 +: 8] = $unsigned(data0);
    assign pool_lin_reg[1*8 +: 8] = $unsigned(data1);
    assign pool_lin_reg[2*8 +: 8] = $unsigned(data2);
    assign pool_lin_reg[3*8 +: 8] = $unsigned(data3);
    assign pool_lin_reg[4*8 +: 8] = $unsigned(data4);
    assign pool_lin_reg[5*8 +: 8] = $unsigned(data5);
    assign pool_lin_reg[6*8 +: 8] = $unsigned(data6);
    assign pool_lin_reg[7*8 +: 8] = $unsigned(data7);
    assign pool_lin_reg[8*8 +: 8] = $unsigned(data8);

endmodule
