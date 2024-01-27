#!/bin/bash

input_file="../syn/out/cv32e40p_top.gsf.csv"
output_file="./paths.csv"
grep -iE '[.]*,4[.]+' "$input_file" | sed 's/\t/:/' > "$output_file"