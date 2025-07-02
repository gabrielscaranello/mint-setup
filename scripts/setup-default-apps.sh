#! /bin/bash

PWD=$(pwd)

echo "Setup default apps..."

echo "Setting default terminal..."
sudo update-alternatives --set x-terminal-emulator "$(which kitty)"

echo "Copying mimeapps.list..."
cp "$PWD"/config/mimeapps.list ~/.config/mimeapps.list

echo "Default apps setup done."
