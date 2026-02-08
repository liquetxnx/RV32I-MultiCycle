# Notice
This src file is intermediate stage for 5-stage pipelined RV32I which is consiered Data Hazard and Control Hazard.
So, simply report what I did.

2026/1/20 ~ 2026/2/9

# RV32I MultiCycle Processor

- Add 4 register between each stage(IF, ID, EX, MEM, WB)
- Not Considered Hazard
- Therefore, each command need 5 clock cycle.

# How to run
> LiNUX, iverilog compiler, gtwave are needed

- `iverilog -g2005 -o simv *.v`
- `vvp simv`
- `gtkwave waves_tb_Top_Module.vcd`

# Result

![sim] (img/sim.png)