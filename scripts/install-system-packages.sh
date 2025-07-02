#! /bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/system-packages")

echo "Installing native packages..."
sudo apt update
sudo apt upgrade -y
echo "$PACKAGES" | xargs sudo apt install -y
echo "Native packages installed."
