#!/bin/bash

# Check if we are in a Git repository
if [ ! -d .git ]; then
    echo "Error: You are not in the root of a Git repository."
    exit 1
fi

# Run git log and save the output to CHANGELOG.md
changelog="$(pwd)/CHANGELOG.md"
echo '```' > "$changelog"
git log --graph --pretty=format:'Commit: %h - %s%nAuthor: %an - %cD%n' --decorate >> "$changelog"
echo '```' >> "$changelog"

# Use the first argument passed as the commit message
commit_message=$1

# Check if a commit message was provided
if [ -z "$commit_message" ]; then
    echo "Error: No commit message provided."
    echo "Please provide a commit message as the first argument."
    echo 'Expected format: alias "commit message"'
    exit 1
fi

# Ask for confirmation
read -p "Are you sure you want to push this commit? [Y/n]: " confirmation

# Check the user's response
if [ "$confirmation" != "Y" ]; then
    echo "Operation cancelled."
    echo "Neither commit nor push will be performed."
    exit 0
fi

# Commit changes
git add -A
git commit -m "$commit_message"

# Push changes
git push github
git push gitlab
git push bitbucket
