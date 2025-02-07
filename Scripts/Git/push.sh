#!/bin/bash

# Check if we are in a Git repository
if [ ! -d .git ]; then
    echo "Error: You are not in the root of a Git repository."
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

# Extract the number part of the version (the number after 'v')
current_version_number=$(echo "$version_number" | sed 's/^v//')

# Check if the extracted version number is a valid number
if ! [[ "$current_version_number" =~ ^[0-9]+$ ]]; then
    echo "Error: VERSION.md contains an invalid version number."
    echo "Expected format: \`v1\`"
    exit 1
fi

# Use the first argument passed as the commit message
commit_message=$1

# Check if a commit message was provided
if [ -z "$commit_message" ]; then
    echo "Error: No commit message provided."
    echo "Please provide a commit message as the first argument."
    echo 'Expected format: alias "commit message"'
    exit 1
fi

# Show confirmation message and ask for confirmation
echo "The commit message will be: $commit_message"
read -p "Are you sure you want to push this commit? [Y/n]: " confirmation

# Check the user's response
if [ "$confirmation" != "Y" ]; then
    echo "Operation cancelled."
    echo "Neither commit nor push will be performed."
    exit 0
fi

# Increment the version number (only after confirmation)
new_version_number=$((current_version_number + 1))

# Format the new version as '`v<new_number>`' (with backticks)
new_version="\`v$new_version_number\`"

# Update VERSION.md with the new version number
echo "$new_version" > "$version"

# Show new version number
echo "Version updated to: $new_version"

# Commit changes
git add -A
git commit -m "$commit_message"

# Push changes
git push github
git push gitlab
git push bitbucket
