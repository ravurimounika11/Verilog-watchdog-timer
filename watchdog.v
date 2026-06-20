`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2026 01:58:09
// Design Name: 
// Module Name: watchdog
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module watchdog (
    input clk,
    input rst,
    input kick,          // reset watchdog signal
    output reg wdt_reset // system reset output
);

parameter TIMEOUT = 10;

reg [3:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 0;
        wdt_reset <= 0;
    end
    else begin
        if (kick) begin
            counter <= 0;      // reset counter when kicked
            wdt_reset <= 0;
        end
        else begin
            if (counter >= TIMEOUT) begin
                wdt_reset <= 1; // timeout occurred
            end
            else begin
                counter <= counter + 1;
            end
        end
    end
end

endmodule

  
