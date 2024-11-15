`timescale 1ns/1ps
module ram_mux #(
    parameter MODE_DATA = 0,
    parameter MODE_WEIGHT = 1
)(
    input clk,
    input rst_n,
    input mode,
    input ram_en,

    output reg [$clog2(8*8*1)-1:0] data_ram_waddr,
    output reg [$clog2(3*3*3*2)-1:0] weight_ram_waddr,

    output weight_ram_en,
    output data_ram_en
);
    
    assign data_ram_en = ram_en && (mode == MODE_DATA);
    assign weight_ram_en = ram_en && (mode == MODE_WEIGHT);

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) begin
            data_ram_waddr <= 0;
        end
        else if(data_ram_en) begin
            if(data_ram_waddr == 8*8*1-1)
                data_ram_waddr <= 0;
            else
                data_ram_waddr <= data_ram_waddr + 1;
        end
    end

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) begin
            weight_ram_waddr <= 0;
        end
        else if(weight_ram_en) begin
            if(weight_ram_waddr == 3*3*3*2-1)
                weight_ram_waddr <= 0;
            else
                weight_ram_waddr <= weight_ram_waddr + 1;
        end
    end

endmodule
