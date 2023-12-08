`timescale 1ns/1ps
module connect_mux_weight (
    input [3:0] cnt,
    input [3*3*1*8-1:0] weight_lin,   // divide dimension here

    output reg [7:0] weight
);
    
    always @(*) begin
        case (cnt)
            0: weight = weight_lin[0*8 +: 8];
            1: weight = weight_lin[1*8 +: 8];
            2: weight = weight_lin[2*8 +: 8];
            3: weight = weight_lin[3*8 +: 8];
            4: weight = weight_lin[4*8 +: 8];
            5: weight = weight_lin[5*8 +: 8];
            6: weight = weight_lin[6*8 +: 8];
            7: weight = weight_lin[7*8 +: 8];
            8: weight = weight_lin[8*8 +: 8];
            // default:
        endcase
    end

endmodule