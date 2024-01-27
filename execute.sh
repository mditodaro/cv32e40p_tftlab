#!/bin/bash

make pt/generate_gsf
make questa/compile-timing
make compile_sbst
make questa/lsim/gate-timing/shell
make zoix/compile
make zoix/compile-timing

make zoix/fgen/sdd K=1.05
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.05.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.05.rpt.hier

make zoix/fgen/sdd K=1.10
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.10.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.10.rpt.hier

make zoix/fgen/sdd K=1.15
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.15.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.15.rpt.hier

make zoix/fgen/sdd K=1.20
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.20.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.20.rpt.hier

make zoix/fgen/sdd K=1.25
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.25.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.25.rpt.hier

make zoix/fgen/sdd K=1.30
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.30.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.30.rpt.hier

make zoix/fgen/sdd K=1.35
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.35.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.35.rpt.hier

make zoix/fgen/sdd K=1.40
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.40.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.40.rpt.hier

make zoix/fgen/sdd K=1.45
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.45.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.45.rpt.hier

make zoix/fgen/sdd K=1.50
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.50.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.50.rpt.hier

make zoix/fgen/sdd K=1.55
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.55.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.55.rpt.hier

make zoix/fgen/sdd K=1.60
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.60.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.60.rpt.hier

make zoix/fgen/sdd K=1.65
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.65.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.65.rpt.hier

make zoix/fgen/sdd K=1.70
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.70.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.70.rpt.hier

make zoix/fgen/sdd K=1.75
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.75.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.75.rpt.hier

make zoix/fgen/sdd K=1.80
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.80.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.80.rpt.hier

make zoix/fgen/sdd K=1.85
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.85.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.85.rpt.hier

make zoix/fgen/sdd K=1.90
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.90.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.90.rpt.hier

make zoix/fgen/sdd K=1.95
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.95.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K1.95.rpt.hier

make zoix/fgen/sdd K=2
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K2.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K2.rpt.hier

make zoix/fgen/sdd K=3
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K3.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K3.rpt.hier

make zoix/fgen/sdd K=4
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K4.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K4.rpt.hier

make zoix/fgen/sdd K=5
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K5.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K5.rpt.hier

make zoix/fgen/sdd K=6
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K6.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K6.rpt.hier

make zoix/fgen/sdd K=7
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K7.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K7.rpt.hier

make zoix/fgen/sdd K=8
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K8.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K8.rpt.hier

make zoix/fgen/sdd K=9
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K9.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K9.rpt.hier

make zoix/fgen/sdd K=10
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K10.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K10.rpt.hier

make zoix/fgen/sdd K=20
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K20.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K20.rpt.hier

make zoix/fgen/sdd K=30
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K30.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K30.rpt.hier

make zoix/fgen/sdd K=40
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K40.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K40.rpt.hier

make zoix/fgen/sdd K=50
make zoix/lsim-timing
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K50.rpt 
./extractor.sh run/zoix_timing/cv32e40p_top_sdd_K50.rpt.hier

