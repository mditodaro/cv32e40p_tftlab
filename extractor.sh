#!/bin/bash

# Check if a file path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

# Get the Fault Coverage percentage using grep, awk, and sed
fault_coverage=$(grep -A 1 "Fault Coverage" "$1" | grep -oP '\d+\.\d+%')
fault_coverage=$(echo "$fault_coverage" | awk 'NR==2')

# Print the Fault Coverage percentage and append to output.txt
echo "$fault_coverage" >> output.txt

