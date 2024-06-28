#! /bin/bash

PWD=$(pwd)

. $PWD/scripts/_utils.sh

echo "Removing xterm..."
install_nala
sudo apt purge -y xterm*
sudo apt autoremove
echo "xterm removed."
