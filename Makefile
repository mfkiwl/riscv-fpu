default: none

GHDL ?= /opt/ghdl/bin/ghdl
VERILATOR ?= /opt/verilator/bin/verilator
SYSTEMC ?= /opt/systemc
TESTFLOAT ?= /opt/testfloat/testfloat_gen
PYTHON ?= /usr/bin/python2

TEST ?= all

generate:
	tests/generate_test_cases.sh tests ${TESTFLOAT} ${PYTHON}

fpu_verilog:
	sim/test_fpu_verilog.sh ${VERILATOR} ${SYSTEMC} ${TEST}

lzc_verilog:
	sim/test_lzc_verilog.sh ${VERILATOR} ${SYSTEMC}

fpu_vhdl:
	sim/test_fpu_vhdl.sh ${GHDL} ${TEST}

lzc_vhdl:
	sim/test_lzc_vhdl.sh ${GHDL}

all: generate lzc_vhdl lzc_verilog fpu_vhdl fpu_verilog
