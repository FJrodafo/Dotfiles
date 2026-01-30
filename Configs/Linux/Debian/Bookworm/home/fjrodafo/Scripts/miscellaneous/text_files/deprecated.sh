#!/bin/bash

# Input/Output file path with its extension
input="/home/user/path/to/file.txt"
output="/home/user/path/to/sorted_file.txt"

# Check if the file exists
if [ ! -e "$input" ]; then
    echo "The file $input does not exist."
    exit 1
fi

# Get the file name without the path and extension
filename=$(basename "$input")
filename_no_ext="${filename%.*}"

# File extension
file_extension="${input##*.}"

# Sort the file and save the result to a new file
sort "$input" > "$output"

echo "The file $filename has been sorted alphabetically, and the result has been saved to $output."
