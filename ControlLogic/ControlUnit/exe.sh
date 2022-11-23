#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f *.vcd

# run Verilator to translate Verilog into C++, including C++ testbench
verilator -Wall --cc --trace types_pkg.sv control_unit.sv --top-module control_unit --exe control_unit_tb.cpp

# build C++ project via make automatically generated by Verilator
make -j -C obj_dir/ -f Vcontrol_unit.mk Vcontrol_unit

# run executable simulation file
echo "Running simulation"
obj_dir/Vcontrol_unit
echo "Simulation completed"

