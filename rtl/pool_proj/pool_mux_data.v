`timescale 1ns/1ps
module pool_mux_data(
    input [1:0] r_cnt,
    input [1:0] c_cnt,
    input [6*6*1*8-1:0] conv_lin,   // divide dimension here

    output reg [7:0] conv0,
    output reg [7:0] conv1,
    output reg [7:0] conv2,
    output reg [7:0] conv3
);

    always @(*) begin
        case ({r_cnt, c_cnt})
            {2'd0, 2'd0}: begin
                conv0 = conv_lin[((0*6+0)*2  )*8 +: 8];
                conv1 = conv_lin[((0*6+0)*2+1)*8 +: 8];
                conv2 = conv_lin[((0*6+0)*2+6)*8 +: 8];
                conv3 = conv_lin[((0*6+0)*2+7)*8 +: 8];
            end
            {2'd0, 2'd1}: begin
                conv0 = conv_lin[((0*6+1)*2  )*8 +: 8];
                conv1 = conv_lin[((0*6+1)*2+1)*8 +: 8];
                conv2 = conv_lin[((0*6+1)*2+6)*8 +: 8];
                conv3 = conv_lin[((0*6+1)*2+7)*8 +: 8];
            end
            {2'd0, 2'd2}: begin
                conv0 = conv_lin[((0*6+2)*2  )*8 +: 8];
                conv1 = conv_lin[((0*6+2)*2+1)*8 +: 8];
                conv2 = conv_lin[((0*6+2)*2+6)*8 +: 8];
                conv3 = conv_lin[((0*6+2)*2+7)*8 +: 8];
            end



            {2'd1, 2'd0}: begin
                conv0 = conv_lin[((1*6+0)*2  )*8 +: 8];
                conv1 = conv_lin[((1*6+0)*2+1)*8 +: 8];
                conv2 = conv_lin[((1*6+0)*2+6)*8 +: 8];
                conv3 = conv_lin[((1*6+0)*2+7)*8 +: 8];
            end
            {2'd1, 2'd1}: begin
                conv0 = conv_lin[((1*6+1)*2  )*8 +: 8];
                conv1 = conv_lin[((1*6+1)*2+1)*8 +: 8];
                conv2 = conv_lin[((1*6+1)*2+6)*8 +: 8];
                conv3 = conv_lin[((1*6+1)*2+7)*8 +: 8];
            end
            {2'd1, 2'd2}: begin
                conv0 = conv_lin[((1*6+2)*2  )*8 +: 8];
                conv1 = conv_lin[((1*6+2)*2+1)*8 +: 8];
                conv2 = conv_lin[((1*6+2)*2+6)*8 +: 8];
                conv3 = conv_lin[((1*6+2)*2+7)*8 +: 8];
            end



            {2'd2, 2'd0}: begin
                conv0 = conv_lin[((2*6+0)*2  )*8 +: 8];
                conv1 = conv_lin[((2*6+0)*2+1)*8 +: 8];
                conv2 = conv_lin[((2*6+0)*2+6)*8 +: 8];
                conv3 = conv_lin[((2*6+0)*2+7)*8 +: 8];
            end
            {2'd2, 2'd1}: begin
                conv0 = conv_lin[((2*6+1)*2  )*8 +: 8];
                conv1 = conv_lin[((2*6+1)*2+1)*8 +: 8];
                conv2 = conv_lin[((2*6+1)*2+6)*8 +: 8];
                conv3 = conv_lin[((2*6+1)*2+7)*8 +: 8];
            end
            {2'd2, 2'd2}: begin
                conv0 = conv_lin[((2*6+2)*2  )*8 +: 8];
                conv1 = conv_lin[((2*6+2)*2+1)*8 +: 8];
                conv2 = conv_lin[((2*6+2)*2+6)*8 +: 8];
                conv3 = conv_lin[((2*6+2)*2+7)*8 +: 8];
            end
            // default:
        endcase
    end

endmodule
