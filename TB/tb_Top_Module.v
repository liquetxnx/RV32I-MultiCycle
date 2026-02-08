`timescale 1ns/1ps
`include "defines.v"

module tb_Top_Module;

reg clk;
reg rst;


Top_Module DUT(

    .clk(clk),
    .rst(rst)

    
);

initial begin
    $dumpfile("waves_Top_Module.vcd");
    $dumpvars(0,tb_Top_Module);
end

initial begin
    clk =0;
    rst =0;
end


initial #2 rst=1;
initial #4 rst = 0;

always #1 clk = ~clk; 

initial begin
    #1000;
    $finish;
end

endmodule
