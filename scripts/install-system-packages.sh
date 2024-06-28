#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/system-packages" | tr '\n' ' ')

. $PWD/scripts/_utils.sh

echo "Installing native packages..."
install_nala
sudo apt upgrade -y
sudo apt install -y $PACKAGES
echo "native packages installed."
