#!/bin/bash

# Verify that at least one parameter was passed
if [ $# -lt 1 ]; then
    echo "Use: $0 <file_path>"
    exit 1
fi

# Input file (first argument)
input="$1"

# Check if the file exists
if [ ! -f "$input" ]; then
    echo "Error: $input is not a valid file."
    exit 1
fi

# Extract name and extension
filename=$(basename "$input")              # name with extension
filename_no_ext="${filename%.*}"           # name without extension
file_extension="${filename##*.}"           # extension
dir=$(dirname "$input")                    # directory where the file is located

# Generate output file with "_sorted" in the same directory
output="$dir/${filename_no_ext}_sorted.$file_extension"

# Sort the file and save the result to a new file
sort "$input" > "$output"

echo "The file $filename has been sorted alphabetically and saved as $output"
