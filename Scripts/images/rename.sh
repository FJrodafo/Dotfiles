#!/bin/bash

# Directory where the images are located
DIRECTORY="/home/user/path/to/pictures"

# Prefix for the new name of the images
DATE=$(date +%Y%m%d)
COUNTER=1

# Ensure the directory exists
if [ ! -d "$DIRECTORY" ]; then
  echo "The directory $DIRECTORY does not exist."
  exit 1
fi

# Iterate over the images in the directory
for PHOTO in "$DIRECTORY"/_DSC*.JPG; do
  # Check if the file exists
  if [ -f "$PHOTO" ]; then
    NEW_NAME="$DIRECTORY/IMG_${DATE}_${COUNTER}.jpg"
    mv "$PHOTO" "$NEW_NAME"
    echo "Renamed: $PHOTO -> $NEW_NAME"
    COUNTER=$((COUNTER + 1))
  fi
done

echo "Renaming complete. A total of $((COUNTER - 1)) files were renamed."
