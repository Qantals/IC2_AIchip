`timescale 1ns/1ps
module pool_mux_data_win(
    input [3:0] cnt,
    input [6*6*1*8-1:0] conv_lin,   // divide dimension here

    output reg [7:0] conv0,
    output reg [7:0] conv1,
    output reg [7:0] conv2,
    output reg [7:0] conv3
);

    always @(*) begin
        case (cnt)
            4'd0: begin
                conv0 = conv_lin[((0*6+0)*2  )*8 +: 8];
                conv1 = conv_lin[((0*6+0)*2+1)*8 +: 8];
                conv2 = conv_lin[((0*6+0)*2+6)*8 +: 8];
                conv3 = conv_lin[((0*6+0)*2+7)*8 +: 8];
            end
            4'd1: begin
                conv0 = conv_lin[((0*6+1)*2  )*8 +: 8];
                conv1 = conv_lin[((0*6+1)*2+1)*8 +: 8];
                conv2 = conv_lin[((0*6+1)*2+6)*8 +: 8];
                conv3 = conv_lin[((0*6+1)*2+7)*8 +: 8];
            end
            4'd2: begin
                conv0 = conv_lin[((0*6+2)*2  )*8 +: 8];
                conv1 = conv_lin[((0*6+2)*2+1)*8 +: 8];
                conv2 = conv_lin[((0*6+2)*2+6)*8 +: 8];
                conv3 = conv_lin[((0*6+2)*2+7)*8 +: 8];
            end



            4'd3: begin
                conv0 = conv_lin[((1*6+0)*2  )*8 +: 8];
                conv1 = conv_lin[((1*6+0)*2+1)*8 +: 8];
                conv2 = conv_lin[((1*6+0)*2+6)*8 +: 8];
                conv3 = conv_lin[((1*6+0)*2+7)*8 +: 8];
            end
            4'd4: begin
                conv0 = conv_lin[((1*6+1)*2  )*8 +: 8];
                conv1 = conv_lin[((1*6+1)*2+1)*8 +: 8];
                conv2 = conv_lin[((1*6+1)*2+6)*8 +: 8];
                conv3 = conv_lin[((1*6+1)*2+7)*8 +: 8];
            end
            4'd5: begin
                conv0 = conv_lin[((1*6+2)*2  )*8 +: 8];
                conv1 = conv_lin[((1*6+2)*2+1)*8 +: 8];
                conv2 = conv_lin[((1*6+2)*2+6)*8 +: 8];
                conv3 = conv_lin[((1*6+2)*2+7)*8 +: 8];
            end



            4'd6: begin
                conv0 = conv_lin[((2*6+0)*2  )*8 +: 8];
                conv1 = conv_lin[((2*6+0)*2+1)*8 +: 8];
                conv2 = conv_lin[((2*6+0)*2+6)*8 +: 8];
                conv3 = conv_lin[((2*6+0)*2+7)*8 +: 8];
            end
            4'd7: begin
                conv0 = conv_lin[((2*6+1)*2  )*8 +: 8];
                conv1 = conv_lin[((2*6+1)*2+1)*8 +: 8];
                conv2 = conv_lin[((2*6+1)*2+6)*8 +: 8];
                conv3 = conv_lin[((2*6+1)*2+7)*8 +: 8];
            end
            4'd8: begin
                conv0 = conv_lin[((2*6+2)*2  )*8 +: 8];
                conv1 = conv_lin[((2*6+2)*2+1)*8 +: 8];
                conv2 = conv_lin[((2*6+2)*2+6)*8 +: 8];
                conv3 = conv_lin[((2*6+2)*2+7)*8 +: 8];
            end
            default: begin
                conv0 = 0;
                conv1 = 0;
                conv2 = 0;
                conv3 = 0;
            end
        endcase
    end

endmodule
