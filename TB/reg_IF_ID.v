module reg_IF_ID(
    input wire clk,
    input wire rst,
    input wire [31:0] if_instr,
    input wire [31:0] if_pc,
    input wire [31:0] if_pc_plus_4,

    output reg [31:0] id_instr,
    output reg [31:0] id_pc,
    output reg [31:0] id_pc_plus_4
    

);



always @(posedge clk) begin



        id_instr <= if_instr;
        id_pc <= if_pc;
        id_pc_plus_4 <= if_pc_plus_4;


    
    
end

endmodule