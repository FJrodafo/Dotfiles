#!/bin/bash

# Ask user to enter version number
#read -p "Enter the version number (just the number): " version_number

# Verify that the user entered a value
#if [ -z "$version_number" ];
#then
#    echo "Error: No version number provided. Aborting."
#    exit 1
#fi

# Commit changes
#git add -A
#git commit -m "v$version_number"

# Push changes
#git push github
#git push gitlab
#git push bitbucket

#
# OLD ABOVE / NEW BELOW
#

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
read -p "Are you sure you want to continue with this commit message? [Y/n]: " confirmation

# Check the user's response
if [[ "$confirmation" != "Y" && "$confirmation" != "" ]]; then
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
