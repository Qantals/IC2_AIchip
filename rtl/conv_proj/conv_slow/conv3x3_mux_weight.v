`timescale 1ns/1ps
module conv3x3_mux_weight (
    input [3:0] cnt,

    input [7:0] weight0,
    input [7:0] weight1,
    input [7:0] weight2,
    input [7:0] weight3,
    input [7:0] weight4,
    input [7:0] weight5,
    input [7:0] weight6,
    input [7:0] weight7,
    input [7:0] weight8,

    output reg [7:0] weight
);
    
    always @(*) begin
        case (cnt)
            0: weight = weight0;
            1: weight = weight1;
            2: weight = weight2;
            3: weight = weight3;
            4: weight = weight4;
            5: weight = weight5;
            6: weight = weight6;
            7: weight = weight7;
            8: weight = weight8;
            default: weight = 0;
        endcase
    end

endmodule