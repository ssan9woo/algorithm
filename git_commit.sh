#!/bin/bash

# Get the current date in YYMMDD format
TODAY=$(date +%y%m%d)

# Add all files
git add .

# Commit with date as the message
git commit -m "$TODAY"

# Push to remote repository
git push

echo "Successfully committed and pushed with message: $TODAY" 