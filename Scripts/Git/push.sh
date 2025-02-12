#!/bin/bash

# Check if we are inside a Git repository by looking for the .git directory
# If the directory does not exist, exit with an error message
if [ ! -d .git ]; then
    echo "Error: You are not in the root of a Git repository."
    exit 1
fi

# Store the first argument passed to the script as the commit message
commit_message=$1

# Check if a commit message was provided as the first argument
# If no commit message is provided, display an error and exit the script
if [ -z "$commit_message" ]; then
    echo "Error: No commit message provided."
    echo "Please provide a commit message as the first argument."
    echo 'Expected format: alias "commit message"'
    exit 1
fi

# Prompt the user for confirmation before proceeding with the commit and push
# This helps prevent accidental commits and pushes
read -p "Are you sure you want to push this commit? [Y/n]: " confirmation

# If the user does not confirm with 'Y' (or presses Enter), cancel the operation
# The script will exit without making any changes to the repository
if [ "$confirmation" != "Y" ]; then
    echo "Operation cancelled."
    echo "Neither commit nor push will be performed."
    exit 0
fi

# Prepare to log the commit history to the CHANGELOG.md file
# The output will include a formatted commit graph, commit hash, message, author, and date
changelog="$(pwd)/CHANGELOG.md"

# Start the CHANGELOG.md file with a code block to keep the log output structured
echo '```' > "$changelog"

# Get the git commit log with details such as commit hash, subject, author, and date
# Append this information to the CHANGELOG.md file
git log --graph --pretty=format:'Commit: %h - %s%nAuthor: %an - %cD%n' --decorate >> "$changelog"

# Close the code block in the CHANGELOG.md file
echo '```' >> "$changelog"

# Add all changes to the staging area for commit
# This includes new files, modifications, and deletions
git add -A

# Commit the changes with the provided commit message
git commit -m "$commit_message"

# Push the changes to multiple remotes: GitHub, GitLab, and Bitbucket
# These remotes must be properly configured in the repository for this to work
git push github
git push gitlab
git push bitbucket
