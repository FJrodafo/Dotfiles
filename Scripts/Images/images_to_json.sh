#!/bin/bash

# Path to the folder containing the image files
folder="./path/to/folder_with_images"

# Output JSON file path
json_file="./path/to/folder_with_images.json"

# Create the header of the JSON file
echo "[" > $json_file

# Iterate over the .jpg, .jpeg, and .png files in the folder
for image_file in "$folder"/*.{jpg,jpeg,png}; do
    # Get only the file name (without the path)
    file_name=$(basename "$image_file")

    # Add the file name to the JSON file
    echo "  \"$file_name\"," >> $json_file
done

# Use find to get all .jpg, .jpeg, and .png files in the folder and its subfolders
# find "$folder" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | while read -r image_file; do
#     # Get only the file name (without the path)
#     file_name=$(basename "$image_file")
# 
#     # Add the file name to the JSON file
#     echo "  \"$file_name\"," >> "$json_file"
# done

# Remove the last comma from the JSON file
sed -i '$ s/,$//' $json_file

# Close the JSON file
echo "]" >> $json_file

echo "Generated JSON file: $json_file"