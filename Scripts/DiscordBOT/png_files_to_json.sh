#!/bin/bash

# Path to the folder containing the .png files (relative to the script)
folder="./folder_with_images"

# Output JSON file name
json_file="files.json"

# Create the header of the JSON file
echo "[" > $json_file

# Iterate over the .png files in the folder
for png_file in "$folder"/*.png; do
    # Get only the file name (without the path)
    file_name=$(basename "$png_file")

    # Add the file name to the JSON file
    echo "  \"$file_name\"," >> $json_file
done

# Remove the last comma from the JSON file
sed -i '$ s/,$//' $json_file

# Close the JSON file
echo "]" >> $json_file

echo "Generated JSON file: $json_file"
