#!/bin/bash

# Path to the directory containing the image files
DIRECTORY="./path/to/directory"

# Output JSON file path
OUTPUT="./path/to/file.json"

# Create the header of the JSON file
echo "[" > $OUTPUT

# Iterate over the .jpg, .jpeg, and .png files in the directory
for IMAGE_FILE in "$DIRECTORY"/*.{jpg,jpeg,png}; do
    # Get only the file name (without the path)
    FILE_NAME=$(basename "$IMAGE_FILE")

    # Add the file name to the JSON file
    echo "  \"$FILE_NAME\"," >> "$OUTPUT"
done

# Use find to get all .jpg, .jpeg, and .png files in the directory and its subdirectories
# find "$DIRECTORY" -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \) | while read -r IMAGE_FILE; do
#     # Get only the file name (without the path)
#     FILE_NAME=$(basename "$IMAGE_FILE")
# 
#     # Add the file name to the JSON file
#     echo "  \"$FILE_NAME\"," >> "$OUTPUT"
# done

# Remove the last comma from the JSON file
sed -i '$ s/,$//' $OUTPUT

# Close the JSON file
echo "]" >> $OUTPUT

echo "Generated JSON file: $OUTPUT"
