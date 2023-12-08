`timescale 1ns/1ps
module connect_mux_data(
    input [3:0] cnt,
    input [3*3*1*8-1:0] pool_lin,   // divide dimension here

    output reg [7:0] data
);

    always @(*) begin
        case (cnt)
            0: data = pool_lin[0*8 +: 8];
            1: data = pool_lin[1*8 +: 8];
            2: data = pool_lin[2*8 +: 8];
            3: data = pool_lin[3*8 +: 8];
            4: data = pool_lin[4*8 +: 8];
            5: data = pool_lin[5*8 +: 8];
            6: data = pool_lin[6*8 +: 8];
            7: data = pool_lin[7*8 +: 8];
            8: data = pool_lin[8*8 +: 8];
            // default:
        endcase
    end

endmodule
