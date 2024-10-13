#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/unused-packages" | tr '\n' ' ')

echo "Removing unused packages..."
sudo apt update
sudo apt purge -y $PACKAGES
sudo apt autoremove
echo "Unused packages removed."
