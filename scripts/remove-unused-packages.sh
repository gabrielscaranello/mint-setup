#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/unused-packages" | tr '\n' ' ')

. $PWD/scripts/_utils.sh

echo "Removing unused packages..."
install_nala
sudo apt update
sudo apt purge -y $PACKAGES
sudo apt autoremove
echo "Unused packages removed."
