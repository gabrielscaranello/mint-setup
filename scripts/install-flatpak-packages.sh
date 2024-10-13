#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/flatpak-packages" | tr '\n' ' ')

echo "Installing flatpak packages..."
echo "Enabling Flathub..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Installing packages..."
flatpak install flathub -y $PACKAGES
echo "Flatpak packages installed."
