`timescale 1ns/1ps
module control (
    input clk,
    input rst_n,
    input calc_en,

    input conv_fin,
    input pool_fin,
    input connect_fin,

    output conv_en,
    output pool_en,
    output connect_en,
    output out_data_flag
);

    reg [2:0] state_cur;
    reg [2:0] state_nxt;
    parameter IDLE = 0,
            CONV = 1,
            POOL = 2,
            CONNECT = 3,
            FIN = 4;

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n)
            state_cur <= IDLE;
        else
            state_cur <= state_nxt;
    end
    always @(*) begin
        if(calc_en) begin
            case (state_cur)
                IDLE:    state_nxt = CONV;
                CONV:    state_nxt = (conv_fin)    ? POOL    : CONV;
                POOL:    state_nxt = (pool_fin)    ? CONNECT : POOL;
                CONNECT: state_nxt = (connect_fin) ? FIN     : CONNECT;
                FIN:     state_nxt = CONV;
                default: state_nxt = IDLE;
            endcase
        end
        else begin
            state_nxt = (state_cur == FIN) ? FIN : IDLE;
        end
    end

    assign conv_en = (state_nxt == CONV);
    assign pool_en = (state_nxt == POOL);
    assign connect_en = (state_nxt == CONNECT);
    assign out_data_flag = (state_nxt == FIN);



endmodule
