#!/bin/bash

# Get the path of the folder where the script is located
DIR="$(dirname "$(realpath "$0")")"

# Create (or overwrite) the file List.txt with the list of files and their relative paths
find "$DIR" -type f > "$DIR/List.txt"

# Optional confirmation message
echo "List of files created in $DIR/List.txt"
