`timescale 1ns/1ps
module conv_mux_data_win (
    input [5:0] cnt,
    input [8*8*1*8-1:0] data_lin,

    output reg [7:0] data0,
    output reg [7:0] data1,
    output reg [7:0] data2,
    output reg [7:0] data3,
    output reg [7:0] data4,
    output reg [7:0] data5,
    output reg [7:0] data6,
    output reg [7:0] data7,
    output reg [7:0] data8
);

    always @(*) begin
        case (cnt)
            6'd0: begin
                data0 = data_lin[(0*8+0   )*8 +: 8];
                data1 = data_lin[(0*8+0+1 )*8 +: 8];
                data2 = data_lin[(0*8+0+2 )*8 +: 8];
                data3 = data_lin[(0*8+0+8 )*8 +: 8];
                data4 = data_lin[(0*8+0+9 )*8 +: 8];
                data5 = data_lin[(0*8+0+10)*8 +: 8];
                data6 = data_lin[(0*8+0+16)*8 +: 8];
                data7 = data_lin[(0*8+0+17)*8 +: 8];
                data8 = data_lin[(0*8+0+18)*8 +: 8];
            end
            6'd1: begin
                data0 = data_lin[(0*8+1   )*8 +: 8];
                data1 = data_lin[(0*8+1+1 )*8 +: 8];
                data2 = data_lin[(0*8+1+2 )*8 +: 8];
                data3 = data_lin[(0*8+1+8 )*8 +: 8];
                data4 = data_lin[(0*8+1+9 )*8 +: 8];
                data5 = data_lin[(0*8+1+10)*8 +: 8];
                data6 = data_lin[(0*8+1+16)*8 +: 8];
                data7 = data_lin[(0*8+1+17)*8 +: 8];
                data8 = data_lin[(0*8+1+18)*8 +: 8];
            end
            6'd2: begin
                data0 = data_lin[(0*8+2   )*8 +: 8];
                data1 = data_lin[(0*8+2+1 )*8 +: 8];
                data2 = data_lin[(0*8+2+2 )*8 +: 8];
                data3 = data_lin[(0*8+2+8 )*8 +: 8];
                data4 = data_lin[(0*8+2+9 )*8 +: 8];
                data5 = data_lin[(0*8+2+10)*8 +: 8];
                data6 = data_lin[(0*8+2+16)*8 +: 8];
                data7 = data_lin[(0*8+2+17)*8 +: 8];
                data8 = data_lin[(0*8+2+18)*8 +: 8];
            end
            6'd3: begin
                data0 = data_lin[(0*8+3   )*8 +: 8];
                data1 = data_lin[(0*8+3+1 )*8 +: 8];
                data2 = data_lin[(0*8+3+2 )*8 +: 8];
                data3 = data_lin[(0*8+3+8 )*8 +: 8];
                data4 = data_lin[(0*8+3+9 )*8 +: 8];
                data5 = data_lin[(0*8+3+10)*8 +: 8];
                data6 = data_lin[(0*8+3+16)*8 +: 8];
                data7 = data_lin[(0*8+3+17)*8 +: 8];
                data8 = data_lin[(0*8+3+18)*8 +: 8];
            end
            6'd4: begin
                data0 = data_lin[(0*8+4   )*8 +: 8];
                data1 = data_lin[(0*8+4+1 )*8 +: 8];
                data2 = data_lin[(0*8+4+2 )*8 +: 8];
                data3 = data_lin[(0*8+4+8 )*8 +: 8];
                data4 = data_lin[(0*8+4+9 )*8 +: 8];
                data5 = data_lin[(0*8+4+10)*8 +: 8];
                data6 = data_lin[(0*8+4+16)*8 +: 8];
                data7 = data_lin[(0*8+4+17)*8 +: 8];
                data8 = data_lin[(0*8+4+18)*8 +: 8];
            end
            6'd5: begin
                data0 = data_lin[(0*8+5   )*8 +: 8];
                data1 = data_lin[(0*8+5+1 )*8 +: 8];
                data2 = data_lin[(0*8+5+2 )*8 +: 8];
                data3 = data_lin[(0*8+5+8 )*8 +: 8];
                data4 = data_lin[(0*8+5+9 )*8 +: 8];
                data5 = data_lin[(0*8+5+10)*8 +: 8];
                data6 = data_lin[(0*8+5+16)*8 +: 8];
                data7 = data_lin[(0*8+5+17)*8 +: 8];
                data8 = data_lin[(0*8+5+18)*8 +: 8];
            end



            6'd6: begin
                data0 = data_lin[(1*8+0   )*8 +: 8];
                data1 = data_lin[(1*8+0+1 )*8 +: 8];
                data2 = data_lin[(1*8+0+2 )*8 +: 8];
                data3 = data_lin[(1*8+0+8 )*8 +: 8];
                data4 = data_lin[(1*8+0+9 )*8 +: 8];
                data5 = data_lin[(1*8+0+10)*8 +: 8];
                data6 = data_lin[(1*8+0+16)*8 +: 8];
                data7 = data_lin[(1*8+0+17)*8 +: 8];
                data8 = data_lin[(1*8+0+18)*8 +: 8];
            end
            6'd7: begin
                data0 = data_lin[(1*8+1   )*8 +: 8];
                data1 = data_lin[(1*8+1+1 )*8 +: 8];
                data2 = data_lin[(1*8+1+2 )*8 +: 8];
                data3 = data_lin[(1*8+1+8 )*8 +: 8];
                data4 = data_lin[(1*8+1+9 )*8 +: 8];
                data5 = data_lin[(1*8+1+10)*8 +: 8];
                data6 = data_lin[(1*8+1+16)*8 +: 8];
                data7 = data_lin[(1*8+1+17)*8 +: 8];
                data8 = data_lin[(1*8+1+18)*8 +: 8];
            end
            6'd8: begin
                data0 = data_lin[(1*8+2   )*8 +: 8];
                data1 = data_lin[(1*8+2+1 )*8 +: 8];
                data2 = data_lin[(1*8+2+2 )*8 +: 8];
                data3 = data_lin[(1*8+2+8 )*8 +: 8];
                data4 = data_lin[(1*8+2+9 )*8 +: 8];
                data5 = data_lin[(1*8+2+10)*8 +: 8];
                data6 = data_lin[(1*8+2+16)*8 +: 8];
                data7 = data_lin[(1*8+2+17)*8 +: 8];
                data8 = data_lin[(1*8+2+18)*8 +: 8];
            end
            6'd9: begin
                data0 = data_lin[(1*8+3   )*8 +: 8];
                data1 = data_lin[(1*8+3+1 )*8 +: 8];
                data2 = data_lin[(1*8+3+2 )*8 +: 8];
                data3 = data_lin[(1*8+3+8 )*8 +: 8];
                data4 = data_lin[(1*8+3+9 )*8 +: 8];
                data5 = data_lin[(1*8+3+10)*8 +: 8];
                data6 = data_lin[(1*8+3+16)*8 +: 8];
                data7 = data_lin[(1*8+3+17)*8 +: 8];
                data8 = data_lin[(1*8+3+18)*8 +: 8];
            end
            6'd10: begin
                data0 = data_lin[(1*8+4   )*8 +: 8];
                data1 = data_lin[(1*8+4+1 )*8 +: 8];
                data2 = data_lin[(1*8+4+2 )*8 +: 8];
                data3 = data_lin[(1*8+4+8 )*8 +: 8];
                data4 = data_lin[(1*8+4+9 )*8 +: 8];
                data5 = data_lin[(1*8+4+10)*8 +: 8];
                data6 = data_lin[(1*8+4+16)*8 +: 8];
                data7 = data_lin[(1*8+4+17)*8 +: 8];
                data8 = data_lin[(1*8+4+18)*8 +: 8];
            end
            6'd11: begin
                data0 = data_lin[(1*8+5   )*8 +: 8];
                data1 = data_lin[(1*8+5+1 )*8 +: 8];
                data2 = data_lin[(1*8+5+2 )*8 +: 8];
                data3 = data_lin[(1*8+5+8 )*8 +: 8];
                data4 = data_lin[(1*8+5+9 )*8 +: 8];
                data5 = data_lin[(1*8+5+10)*8 +: 8];
                data6 = data_lin[(1*8+5+16)*8 +: 8];
                data7 = data_lin[(1*8+5+17)*8 +: 8];
                data8 = data_lin[(1*8+5+18)*8 +: 8];
            end



            6'd12: begin
                data0 = data_lin[(2*8+0   )*8 +: 8];
                data1 = data_lin[(2*8+0+1 )*8 +: 8];
                data2 = data_lin[(2*8+0+2 )*8 +: 8];
                data3 = data_lin[(2*8+0+8 )*8 +: 8];
                data4 = data_lin[(2*8+0+9 )*8 +: 8];
                data5 = data_lin[(2*8+0+10)*8 +: 8];
                data6 = data_lin[(2*8+0+16)*8 +: 8];
                data7 = data_lin[(2*8+0+17)*8 +: 8];
                data8 = data_lin[(2*8+0+18)*8 +: 8];
            end
            6'd13: begin
                data0 = data_lin[(2*8+1   )*8 +: 8];
                data1 = data_lin[(2*8+1+1 )*8 +: 8];
                data2 = data_lin[(2*8+1+2 )*8 +: 8];
                data3 = data_lin[(2*8+1+8 )*8 +: 8];
                data4 = data_lin[(2*8+1+9 )*8 +: 8];
                data5 = data_lin[(2*8+1+10)*8 +: 8];
                data6 = data_lin[(2*8+1+16)*8 +: 8];
                data7 = data_lin[(2*8+1+17)*8 +: 8];
                data8 = data_lin[(2*8+1+18)*8 +: 8];
            end
            6'd14: begin
                data0 = data_lin[(2*8+2   )*8 +: 8];
                data1 = data_lin[(2*8+2+1 )*8 +: 8];
                data2 = data_lin[(2*8+2+2 )*8 +: 8];
                data3 = data_lin[(2*8+2+8 )*8 +: 8];
                data4 = data_lin[(2*8+2+9 )*8 +: 8];
                data5 = data_lin[(2*8+2+10)*8 +: 8];
                data6 = data_lin[(2*8+2+16)*8 +: 8];
                data7 = data_lin[(2*8+2+17)*8 +: 8];
                data8 = data_lin[(2*8+2+18)*8 +: 8];
            end
            6'd15: begin
                data0 = data_lin[(2*8+3   )*8 +: 8];
                data1 = data_lin[(2*8+3+1 )*8 +: 8];
                data2 = data_lin[(2*8+3+2 )*8 +: 8];
                data3 = data_lin[(2*8+3+8 )*8 +: 8];
                data4 = data_lin[(2*8+3+9 )*8 +: 8];
                data5 = data_lin[(2*8+3+10)*8 +: 8];
                data6 = data_lin[(2*8+3+16)*8 +: 8];
                data7 = data_lin[(2*8+3+17)*8 +: 8];
                data8 = data_lin[(2*8+3+18)*8 +: 8];
            end
            6'd16: begin
                data0 = data_lin[(2*8+4   )*8 +: 8];
                data1 = data_lin[(2*8+4+1 )*8 +: 8];
                data2 = data_lin[(2*8+4+2 )*8 +: 8];
                data3 = data_lin[(2*8+4+8 )*8 +: 8];
                data4 = data_lin[(2*8+4+9 )*8 +: 8];
                data5 = data_lin[(2*8+4+10)*8 +: 8];
                data6 = data_lin[(2*8+4+16)*8 +: 8];
                data7 = data_lin[(2*8+4+17)*8 +: 8];
                data8 = data_lin[(2*8+4+18)*8 +: 8];
            end
            6'd17: begin
                data0 = data_lin[(2*8+5   )*8 +: 8];
                data1 = data_lin[(2*8+5+1 )*8 +: 8];
                data2 = data_lin[(2*8+5+2 )*8 +: 8];
                data3 = data_lin[(2*8+5+8 )*8 +: 8];
                data4 = data_lin[(2*8+5+9 )*8 +: 8];
                data5 = data_lin[(2*8+5+10)*8 +: 8];
                data6 = data_lin[(2*8+5+16)*8 +: 8];
                data7 = data_lin[(2*8+5+17)*8 +: 8];
                data8 = data_lin[(2*8+5+18)*8 +: 8];
            end



            6'd18: begin
                data0 = data_lin[(3*8+0   )*8 +: 8];
                data1 = data_lin[(3*8+0+1 )*8 +: 8];
                data2 = data_lin[(3*8+0+2 )*8 +: 8];
                data3 = data_lin[(3*8+0+8 )*8 +: 8];
                data4 = data_lin[(3*8+0+9 )*8 +: 8];
                data5 = data_lin[(3*8+0+10)*8 +: 8];
                data6 = data_lin[(3*8+0+16)*8 +: 8];
                data7 = data_lin[(3*8+0+17)*8 +: 8];
                data8 = data_lin[(3*8+0+18)*8 +: 8];
            end
            6'd19: begin
                data0 = data_lin[(3*8+1   )*8 +: 8];
                data1 = data_lin[(3*8+1+1 )*8 +: 8];
                data2 = data_lin[(3*8+1+2 )*8 +: 8];
                data3 = data_lin[(3*8+1+8 )*8 +: 8];
                data4 = data_lin[(3*8+1+9 )*8 +: 8];
                data5 = data_lin[(3*8+1+10)*8 +: 8];
                data6 = data_lin[(3*8+1+16)*8 +: 8];
                data7 = data_lin[(3*8+1+17)*8 +: 8];
                data8 = data_lin[(3*8+1+18)*8 +: 8];
            end
            6'd20: begin
                data0 = data_lin[(3*8+2   )*8 +: 8];
                data1 = data_lin[(3*8+2+1 )*8 +: 8];
                data2 = data_lin[(3*8+2+2 )*8 +: 8];
                data3 = data_lin[(3*8+2+8 )*8 +: 8];
                data4 = data_lin[(3*8+2+9 )*8 +: 8];
                data5 = data_lin[(3*8+2+10)*8 +: 8];
                data6 = data_lin[(3*8+2+16)*8 +: 8];
                data7 = data_lin[(3*8+2+17)*8 +: 8];
                data8 = data_lin[(3*8+2+18)*8 +: 8];
            end
            6'd21: begin
                data0 = data_lin[(3*8+3   )*8 +: 8];
                data1 = data_lin[(3*8+3+1 )*8 +: 8];
                data2 = data_lin[(3*8+3+2 )*8 +: 8];
                data3 = data_lin[(3*8+3+8 )*8 +: 8];
                data4 = data_lin[(3*8+3+9 )*8 +: 8];
                data5 = data_lin[(3*8+3+10)*8 +: 8];
                data6 = data_lin[(3*8+3+16)*8 +: 8];
                data7 = data_lin[(3*8+3+17)*8 +: 8];
                data8 = data_lin[(3*8+3+18)*8 +: 8];
            end
            6'd22: begin
                data0 = data_lin[(3*8+4   )*8 +: 8];
                data1 = data_lin[(3*8+4+1 )*8 +: 8];
                data2 = data_lin[(3*8+4+2 )*8 +: 8];
                data3 = data_lin[(3*8+4+8 )*8 +: 8];
                data4 = data_lin[(3*8+4+9 )*8 +: 8];
                data5 = data_lin[(3*8+4+10)*8 +: 8];
                data6 = data_lin[(3*8+4+16)*8 +: 8];
                data7 = data_lin[(3*8+4+17)*8 +: 8];
                data8 = data_lin[(3*8+4+18)*8 +: 8];
            end
            6'd23: begin
                data0 = data_lin[(3*8+5   )*8 +: 8];
                data1 = data_lin[(3*8+5+1 )*8 +: 8];
                data2 = data_lin[(3*8+5+2 )*8 +: 8];
                data3 = data_lin[(3*8+5+8 )*8 +: 8];
                data4 = data_lin[(3*8+5+9 )*8 +: 8];
                data5 = data_lin[(3*8+5+10)*8 +: 8];
                data6 = data_lin[(3*8+5+16)*8 +: 8];
                data7 = data_lin[(3*8+5+17)*8 +: 8];
                data8 = data_lin[(3*8+5+18)*8 +: 8];
            end




            6'd24: begin
                data0 = data_lin[(4*8+0   )*8 +: 8];
                data1 = data_lin[(4*8+0+1 )*8 +: 8];
                data2 = data_lin[(4*8+0+2 )*8 +: 8];
                data3 = data_lin[(4*8+0+8 )*8 +: 8];
                data4 = data_lin[(4*8+0+9 )*8 +: 8];
                data5 = data_lin[(4*8+0+10)*8 +: 8];
                data6 = data_lin[(4*8+0+16)*8 +: 8];
                data7 = data_lin[(4*8+0+17)*8 +: 8];
                data8 = data_lin[(4*8+0+18)*8 +: 8];
            end
            6'd25: begin
                data0 = data_lin[(4*8+1   )*8 +: 8];
                data1 = data_lin[(4*8+1+1 )*8 +: 8];
                data2 = data_lin[(4*8+1+2 )*8 +: 8];
                data3 = data_lin[(4*8+1+8 )*8 +: 8];
                data4 = data_lin[(4*8+1+9 )*8 +: 8];
                data5 = data_lin[(4*8+1+10)*8 +: 8];
                data6 = data_lin[(4*8+1+16)*8 +: 8];
                data7 = data_lin[(4*8+1+17)*8 +: 8];
                data8 = data_lin[(4*8+1+18)*8 +: 8];
            end
            6'd26: begin
                data0 = data_lin[(4*8+2   )*8 +: 8];
                data1 = data_lin[(4*8+2+1 )*8 +: 8];
                data2 = data_lin[(4*8+2+2 )*8 +: 8];
                data3 = data_lin[(4*8+2+8 )*8 +: 8];
                data4 = data_lin[(4*8+2+9 )*8 +: 8];
                data5 = data_lin[(4*8+2+10)*8 +: 8];
                data6 = data_lin[(4*8+2+16)*8 +: 8];
                data7 = data_lin[(4*8+2+17)*8 +: 8];
                data8 = data_lin[(4*8+2+18)*8 +: 8];
            end
            6'd27: begin
                data0 = data_lin[(4*8+3   )*8 +: 8];
                data1 = data_lin[(4*8+3+1 )*8 +: 8];
                data2 = data_lin[(4*8+3+2 )*8 +: 8];
                data3 = data_lin[(4*8+3+8 )*8 +: 8];
                data4 = data_lin[(4*8+3+9 )*8 +: 8];
                data5 = data_lin[(4*8+3+10)*8 +: 8];
                data6 = data_lin[(4*8+3+16)*8 +: 8];
                data7 = data_lin[(4*8+3+17)*8 +: 8];
                data8 = data_lin[(4*8+3+18)*8 +: 8];
            end
            6'd28: begin
                data0 = data_lin[(4*8+4   )*8 +: 8];
                data1 = data_lin[(4*8+4+1 )*8 +: 8];
                data2 = data_lin[(4*8+4+2 )*8 +: 8];
                data3 = data_lin[(4*8+4+8 )*8 +: 8];
                data4 = data_lin[(4*8+4+9 )*8 +: 8];
                data5 = data_lin[(4*8+4+10)*8 +: 8];
                data6 = data_lin[(4*8+4+16)*8 +: 8];
                data7 = data_lin[(4*8+4+17)*8 +: 8];
                data8 = data_lin[(4*8+4+18)*8 +: 8];
            end
            6'd29: begin
                data0 = data_lin[(4*8+5   )*8 +: 8];
                data1 = data_lin[(4*8+5+1 )*8 +: 8];
                data2 = data_lin[(4*8+5+2 )*8 +: 8];
                data3 = data_lin[(4*8+5+8 )*8 +: 8];
                data4 = data_lin[(4*8+5+9 )*8 +: 8];
                data5 = data_lin[(4*8+5+10)*8 +: 8];
                data6 = data_lin[(4*8+5+16)*8 +: 8];
                data7 = data_lin[(4*8+5+17)*8 +: 8];
                data8 = data_lin[(4*8+5+18)*8 +: 8];
            end





            6'd30: begin
                data0 = data_lin[(5*8+0   )*8 +: 8];
                data1 = data_lin[(5*8+0+1 )*8 +: 8];
                data2 = data_lin[(5*8+0+2 )*8 +: 8];
                data3 = data_lin[(5*8+0+8 )*8 +: 8];
                data4 = data_lin[(5*8+0+9 )*8 +: 8];
                data5 = data_lin[(5*8+0+10)*8 +: 8];
                data6 = data_lin[(5*8+0+16)*8 +: 8];
                data7 = data_lin[(5*8+0+17)*8 +: 8];
                data8 = data_lin[(5*8+0+18)*8 +: 8];
            end
            6'd31: begin
                data0 = data_lin[(5*8+1   )*8 +: 8];
                data1 = data_lin[(5*8+1+1 )*8 +: 8];
                data2 = data_lin[(5*8+1+2 )*8 +: 8];
                data3 = data_lin[(5*8+1+8 )*8 +: 8];
                data4 = data_lin[(5*8+1+9 )*8 +: 8];
                data5 = data_lin[(5*8+1+10)*8 +: 8];
                data6 = data_lin[(5*8+1+16)*8 +: 8];
                data7 = data_lin[(5*8+1+17)*8 +: 8];
                data8 = data_lin[(5*8+1+18)*8 +: 8];
            end
            6'd32: begin
                data0 = data_lin[(5*8+2   )*8 +: 8];
                data1 = data_lin[(5*8+2+1 )*8 +: 8];
                data2 = data_lin[(5*8+2+2 )*8 +: 8];
                data3 = data_lin[(5*8+2+8 )*8 +: 8];
                data4 = data_lin[(5*8+2+9 )*8 +: 8];
                data5 = data_lin[(5*8+2+10)*8 +: 8];
                data6 = data_lin[(5*8+2+16)*8 +: 8];
                data7 = data_lin[(5*8+2+17)*8 +: 8];
                data8 = data_lin[(5*8+2+18)*8 +: 8];
            end
            6'd33: begin
                data0 = data_lin[(5*8+3   )*8 +: 8];
                data1 = data_lin[(5*8+3+1 )*8 +: 8];
                data2 = data_lin[(5*8+3+2 )*8 +: 8];
                data3 = data_lin[(5*8+3+8 )*8 +: 8];
                data4 = data_lin[(5*8+3+9 )*8 +: 8];
                data5 = data_lin[(5*8+3+10)*8 +: 8];
                data6 = data_lin[(5*8+3+16)*8 +: 8];
                data7 = data_lin[(5*8+3+17)*8 +: 8];
                data8 = data_lin[(5*8+3+18)*8 +: 8];
            end
            6'd34: begin
                data0 = data_lin[(5*8+4   )*8 +: 8];
                data1 = data_lin[(5*8+4+1 )*8 +: 8];
                data2 = data_lin[(5*8+4+2 )*8 +: 8];
                data3 = data_lin[(5*8+4+8 )*8 +: 8];
                data4 = data_lin[(5*8+4+9 )*8 +: 8];
                data5 = data_lin[(5*8+4+10)*8 +: 8];
                data6 = data_lin[(5*8+4+16)*8 +: 8];
                data7 = data_lin[(5*8+4+17)*8 +: 8];
                data8 = data_lin[(5*8+4+18)*8 +: 8];
            end
            6'd35: begin
                data0 = data_lin[(5*8+5   )*8 +: 8];
                data1 = data_lin[(5*8+5+1 )*8 +: 8];
                data2 = data_lin[(5*8+5+2 )*8 +: 8];
                data3 = data_lin[(5*8+5+8 )*8 +: 8];
                data4 = data_lin[(5*8+5+9 )*8 +: 8];
                data5 = data_lin[(5*8+5+10)*8 +: 8];
                data6 = data_lin[(5*8+5+16)*8 +: 8];
                data7 = data_lin[(5*8+5+17)*8 +: 8];
                data8 = data_lin[(5*8+5+18)*8 +: 8];
            end
            default: begin
                data0 = 0;
                data1 = 0;
                data2 = 0;
                data3 = 0;
                data4 = 0;
                data5 = 0;
                data6 = 0;
                data7 = 0;
                data8 = 0;
            end
        endcase
    end

endmodule
