#! /bin/bash

PWD=$(pwd)
FILE_NAME="gitflow-installer.sh"
OUTPUT_FILE="/tmp/$FILE_NAME"
DOWNLOAD_URL="https://raw.githubusercontent.com/CJ-Systems/gitflow-cjs/develop/contrib/gitflow-installer.sh"
TMP_DIR="${PWD}/gitflow"

echo "Installing Gitflow CJS..."

echo "Removing old files if exists..."
sudo rm -rf $OUTPUT_FILE "$TMP_DIR"

echo "Downloading..."
wget -c "$DOWNLOAD_URL" -O "$OUTPUT_FILE"

echo "Installing..."
sudo bash $OUTPUT_FILE install stable

echo "Cleaning up..."
sudo rm -rf "$TMP_DIR"

echo "Gitflow CJS installed..."
