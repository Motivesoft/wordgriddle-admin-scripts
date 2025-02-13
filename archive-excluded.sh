#!/bin/bash

# Set variables
HOST=192.168.100.43
PORT=8996
HOSTNAME=nuc0
API_URL="https://$HOST:$PORT/api/excluded/download"
REPO_PATH="/home/ian/Projects/wordgriddle-archive/backup/lists"
FILE_NAME="excluded-words-$HOSTNAME.txt"
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
