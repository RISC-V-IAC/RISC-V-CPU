#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f *.vcd

# run Verilator to translate Verilog into C++, including C++ testbench
verilator -Wall --cc --trace ../TYPES/types_pkg.sv top_PC.sv --top-module top_PC --exe top_PC_tb.cpp

# build C++ project via make automatically generated by Verilator
make -j -C obj_dir/ -f Vtop_PC.mk Vtop_PC

# run executable simulation file
echo "\nRunning simulation"
obj_dir/Vtop_PC
echo "\nSimulation completed"

