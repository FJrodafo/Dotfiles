#!/bin/bash

# Prompt the user to enter the file name with its extension
read -p "Enter the file name with its extension (e.g., file.csv): " input_file

# Check if the file exists
if [ ! -e "$input_file" ]; then
    echo "The file $input_file does not exist."
    exit 1
fi

# Get the file name without the extension
filename=$(basename "$input_file")
filename_no_ext="${filename%.*}"

# File extension
file_extension="${input_file##*.}"

# Build the output file name
output_file="${filename_no_ext}_sorted.$file_extension"

# Sort the file and save the result to a new file
sort "$input_file" > "$output_file"

echo "The file $input_file has been sorted alphabetically, and the result has been saved to $output_file."
