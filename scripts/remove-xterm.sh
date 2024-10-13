#! /bin/bash

PWD=$(pwd)

echo "Removing xterm..."
sudo apt purge -y xterm*
sudo apt autoremove
echo "xterm removed."
