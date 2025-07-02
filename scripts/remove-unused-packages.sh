#! /bin/bash


PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/unused-packages")

echo "Removing unused packages..."
sudo apt update
echo "$PACKAGES" | xargs sudo apt purge -y
sudo apt autoremove --purge -y
echo "Unused packages removed."
