#!/bin/bash

# Ask user to enter version number
read -p "Enter the version number (just the number): " version_number

# Verify that the user entered a value
if [ -z "$version_number" ];
then
    echo "Error: No version number provided. Aborting."
    exit 1
fi

# Commit changes
git add -A
git commit -m "v$version_number"

# Push changes
git push github
git push gitlab
git push bitbucket
