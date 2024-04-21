#!/bin/bash

# Check if we are in a Git repository
if [ ! -d .git ]; then
    echo "You are not in the root of a Git repository. Cannot generate CHANGELOG.md"
    exit 1
fi

# Get current directory path
DIR=$(pwd)

# File name
CHANGELOG="$DIR/CHANGELOG.md"

# Save YAML header to file
echo '```' > "$CHANGELOG"

# Run git log and save the output to file
git log --graph --pretty=format:'Commit: %h - %s%nAuthor: %an - %cD%n' --decorate >> "$CHANGELOG"

# Add YAML closure to the end of the file
echo '```' >> "$CHANGELOG"

# Show confirmation message
echo "Changelog generated in $CHANGELOG"
