#!/bin/bash

# Check if we are in a Git repository
if [ ! -d .git ]; then
    echo "Error: You are not in the root of a Git repository. Cannot generate CHANGELOG.md"
    exit 1
fi

# Get current directory path and file name
DIR=$(pwd)
CHANGELOG="$DIR/CHANGELOG.md"

# Save YAML header to file
# Run git log and save the output to file
# Add YAML closure to the end of the file
echo '```' > "$CHANGELOG"
git log --graph --pretty=format:'Commit: %h - %s%nAuthor: %an - %cD%n' --decorate >> "$CHANGELOG"
echo '```' >> "$CHANGELOG"

# Show confirmation message
echo "Changelog successfully generated at: ./CHANGELOG.md"

# Check if VERSION.md file exists
if [ ! -f "VERSION.md" ]; then
    echo "Error: The VERSION.md file is not found. Aborting."
    exit 1
fi

# Read the contents of VERSION.md file and remove the backticks (`)
version_number=$(cat VERSION.md | sed 's/`//g')

# Check that VERSION.md file is not empty
if [ -z "$version_number" ]; then
    echo "Error: VERSION.md file is empty. Aborting."
    exit 1
fi

# Show confirmation message and ask for confirmation
echo "The commit message will be: $version_number"
read -p "Are you sure you want to push this commit? [Y/n]: " confirmation

# Check the user's response
if [ "$confirmation" != "Y" ]; then
    echo "Operation cancelled. Neither commit nor push will be performed."
    exit 0
fi

# Commit changes
git add -A
git commit -m "$version_number"

# Push changes
git push github
git push gitlab
git push bitbucket
