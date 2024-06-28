#! /bin/bash

echo "Setting up Icon Theme..."

echo "Removing old files if exists..."
rm -rf /tmp/catppuccin-papirus-folders

echo "Cloning Icon Theme..."
git clone https://github.com/catppuccin/papirus-folders.git /tmp/catppuccin-papirus-folders

echo "Installing Icon Theme..."
bash -c "cd /tmp/catppuccin-papirus-folders && sudo cp -r src/* /usr/share/icons/Papirus"

echo "Defining Icon Theme..."
papirus-folders -C cat-mocha-blue
gsettings set org.cinnamon.desktop.interface icon-theme "Papirus-Dark"

echo "Icon Theme setup done."
