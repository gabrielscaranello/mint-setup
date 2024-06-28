#! /bin/bash

LAST_VERSION=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
FILE_NAME="obsidian-${LAST_VERSION}-amd64.deb"
OUTPUT_FILE="/tmp/$FILE_NAME"
DOWNLOAD_URL="https://github.com/obsidianmd/obsidian-releases/releases/download/v$LAST_VERSION/$FILE_NAME"

echo "Installing Obsidian..."

echo "Removing old files if exists..."
rm -rf "$OUTPUT_FILE"

echo "Downloading..."
wget -c "$DOWNLOAD_URL" -O "$OUTPUT_FILE"

echo "Installing..."
sudo dpkg -i "$OUTPUT_FILE"

echo "Obsidian installed..."
