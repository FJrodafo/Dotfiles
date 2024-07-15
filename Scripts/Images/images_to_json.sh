#!/bin/bash

# Path to the folder containing the image files
folder="./path/to/folder"

# Output JSON file path
output="./path/to/file.json"

# Create the header of the JSON file
echo "[" > $output

# Iterate over the .jpg, .jpeg, and .png files in the folder
for image_file in "$folder"/*.{jpg,jpeg,png}; do
    # Get only the file name (without the path)
    file_name=$(basename "$image_file")

    # Add the file name to the JSON file
    echo "  \"$file_name\"," >> "$output"
done

# Use find to get all .jpg, .jpeg, and .png files in the folder and its subfolders
# find "$folder" -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \) | while read -r image_file; do
#     # Get only the file name (without the path)
#     file_name=$(basename "$image_file")
# 
#     # Add the file name to the JSON file
#     echo "  \"$file_name\"," >> "$output"
# done

# Remove the last comma from the JSON file
sed -i '$ s/,$//' $output

# Close the JSON file
echo "]" >> $output

echo "Generated JSON file: $output"
