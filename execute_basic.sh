#!/bin/bash

make pt/generate_gsf
make questa/compile-timing
make compile_sbst
make questa/lsim/gate-timing/shell
make zoix/compile
make zoix/compile-timing
make zoix/fgen/sdd K=1.05
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=./run/zoix_timing/cv32e40p_top_sdd_K1.05.rpt
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.05.rpt.hier
