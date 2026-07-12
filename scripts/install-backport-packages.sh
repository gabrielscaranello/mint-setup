#!/bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/backports-packages")

echo "Installing backports packages..."
sudo apt update
sudo apt upgrade -y
echo "$PACKAGES" | xargs sudo apt -t trixie-backports install -y
echo "Backports packages installed."
