#!/bin/bash

# Define the base directory in the script
base_dir="/home/user/path/to/directory"

# Check if the directory exists
if [ ! -d "$base_dir" ]; then
  echo "The directory '$base_dir' does not exist."
  exit 1
fi

# Output file where the structure will be saved
output_file="directory_structure.txt"

# Recursive function to create the tree structure with lines
create_tree() {
  local dir="$1"
  local indent="$2"
  local prefix="$3"
  
  # Write the current directory to the file
  echo "${indent}${prefix}$(basename "$dir")/" >> "$output_file"
  
  # List all files in the current directory
  local files=("$dir"/*)
  local total_files=${#files[@]}
  
  # Loop through the files in the current directory
  for i in "${!files[@]}"; do
    if [ -f "${files[$i]}" ]; then
      # If it's the last file, use "└─╴", otherwise "├─╴"
      if [ $i -eq $((total_files - 1)) ]; then
        echo "${indent}    └─╴$(basename "${files[$i]}")" >> "$output_file"
      else
        echo "${indent}    ├─╴$(basename "${files[$i]}")" >> "$output_file"
      fi
    fi
  done
  
  # List all subdirectories in the current directory
  local subdirs=("$dir"/*/)
  for i in "${!subdirs[@]}"; do
    if [ -d "${subdirs[$i]}" ]; then
      # If it's the last subdirectory, use "└─╴", otherwise "├─╴"
      if [ $i -eq $((${#subdirs[@]} - 1)) ]; then
        create_tree "${subdirs[$i]}" "${indent}    " "└─╴"
      else
        create_tree "${subdirs[$i]}" "${indent}    " "├─╴"
      fi
    fi
  done
}

# Clear the output file if it exists
> "$output_file"

# Start creating the tree from the base directory
create_tree "$base_dir" "" ""

echo "The directory structure has been saved in '$output_file'."
