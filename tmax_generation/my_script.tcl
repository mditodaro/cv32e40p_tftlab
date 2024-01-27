read_netlist ./syn/techlib/NangateOpenCellLibrary.v -format verilog -insensitive -library
read_netlist ./syn/out/cv32e40p_alu_div.v -format verilog -insensitive
run_build_model cv32e40p_alu_div
run_drc
set_faults -model transition
add_faults -all
set_patterns -internal
set_atpg -full_seq_atpg
run_atpg -auto_compression
set_faults -summary verbose -fault_coverage
report_summaries > ./tmax_generation/report_div_summary.txt
write_faults ./tmax_generation/report_div_faults.txt -all -replace -uncollapsed 
quit
