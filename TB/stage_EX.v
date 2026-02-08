module stage_EX(

    //input EX signal
    input wire a_sel, 
    input wire b_sel, 
    input wire [1:0] alu_op, 
    input wire [1:0] pc_op,
    
    //input data
    input wire [2:0] funct3,
    input wire [6:0] funct7,
    input wire [31:0] pc,
    input wire [31:0] rdata1,
    input wire [31:0] rdata2,
    input wire [31:0] imm,


    //output sig
    output wire [1:0] pcsrc,

    //output data
    output wire [31:0] branch_output,
    output wire [31:0] alu_output

);

wire [3:0] alu_src;
wire [31:0] alu_a_input;
wire [31:0] alu_b_input;
wire BrEq;
wire BrLt;
wire BrLtU;



Mux_2to1 a_inst(
    .sel(a_sel),
    .a(rdata1),
    .b(pc),
    .out(alu_a_input)
);

Mux_2to1 b_inst(
    .sel(b_sel),
    .a(rdata2),
    .b(imm),
    .out(alu_b_input)
);

ALU_Control alu_ctrl_inst(
    .funct7(funct7),
    .funct3(funct3),
    .alu_op(alu_op),
    .alu_src(alu_src)
);

ALU alu_inst(
    .alu_src(alu_src),
    .a(alu_a_input),
    .b(alu_b_input),
    .result(alu_output),
    .BrEq(BrEq),
    .BrLt(BrLt),
    .BrLtU(BrLtU)
);

Branch_Unit branch_inst(
    .pc_op(pc_op),
    .pcsrc(pcsrc),
    .BrEq(BrEq),
    .BrLtU(BrLtU),
    .BrLt(BrLt),
    .funct3(funct3)
);

Adder branch_adder_inst(
    .a(imm),
    .b(pc),
    .c(branch_output)
);

endmodule