
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2026 01:59:46
// Design Name: 
// Module Name: watchdog_tb
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
`timescale 1ns/1ps


module watchdog_tb;

reg clk;
reg rst;
reg kick;
wire wdt_reset;

// Instantiate DUT
watchdog uut (
    .clk(clk),
    .rst(rst),
    .kick(kick),
    .wdt_reset(wdt_reset)
);

// Clock generation (10ns period)
always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    kick = 0;

    #20 rst = 0;

    // Case 1: Kick periodically (No reset expected)
    repeat (5) begin
        #15 kick = 1;
        #10 kick = 0;
    end

    // Case 2: Do NOT kick (Reset expected)
    #200;

    $finish;
end

endmodule
