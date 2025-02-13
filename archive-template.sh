#!/bin/bash

# Set variables
API_URL="https://example.com/api/wordlist"
REPO_PATH="/path/to/your/local/repo"
FILE_NAME="wordlist.txt"
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Change to the repository directory
cd "$REPO_PATH" || exit 1

# Download the file using curl
curl -s -o "$FILE_NAME" "$API_URL"

# Check if there are changes
if git diff --quiet "$FILE_NAME"; then
    echo "No changes detected."
    exit 0
fi

# Add, commit, and push changes
git add "$FILE_NAME"
git commit -m "Updated word list on $CURRENT_DATE"
git push origin main

echo "Changes committed and pushed successfully."
