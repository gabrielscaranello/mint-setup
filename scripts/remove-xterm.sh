#! /bin/bash

PWD=$(pwd)

echo "Removing xterm..."
sudo apt purge -y xterm*
sudo apt autoremove --purge -y
echo "xterm removed."
