#!/bin/bash

# Check if we are in a Git repository
if [ ! -d .git ]; then
    echo "Error: You are not in the root of a Git repository. Cannot generate CHANGELOG.md"
    exit 1
fi

# Get current directory path and file name
dir=$(pwd)
changelog="$dir/CHANGELOG.md"
version="$dir/VERSION.md"

# Save YAML header to file
# Run git log and save the output to file
# Add YAML closure to the end of the file
echo '```' > "$changelog"
git log --graph --pretty=format:'Commit: %h - %s%nAuthor: %an - %cD%n' --decorate >> "$changelog"
echo '```' >> "$changelog"

# Show confirmation message
echo "Changelog successfully generated at: ./CHANGELOG.md"

# Check if VERSION.md file exists
if [ ! -f "$version" ]; then
    echo "Error: The VERSION.md file is not found. Aborting."
    exit 1
fi

# Read the contents of VERSION.md file and remove the backticks (`)
version_number=$(cat "$version" | sed 's/`//g')

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
    echo "Operation cancelled."
    echo "Neither commit nor push will be performed."
    exit 0
fi

# Commit changes
git add -A
git commit -m "$version_number"

# Push changes
git push github
git push gitlab
git push bitbucket
