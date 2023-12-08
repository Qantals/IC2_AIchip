`timescale 1ns/1ps
module conv3x3_mux_data (
    input [3:0] cnt,

    input [7:0] data0,
    input [7:0] data1,
    input [7:0] data2,
    input [7:0] data3,
    input [7:0] data4,
    input [7:0] data5,
    input [7:0] data6,
    input [7:0] data7,
    input [7:0] data8,

    output reg [7:0] data
);
    
    always @(*) begin
        case (cnt)
            0: data = data0;
            1: data = data1;
            2: data = data2;
            3: data = data3;
            4: data = data4;
            5: data = data5;
            6: data = data6;
            7: data = data7;
            8: data = data8;
            default: data = 0;
        endcase
    end

endmodule