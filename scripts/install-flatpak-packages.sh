#! /bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/flatpak-packages")

echo "Installing flatpak packages..."
echo "Enabling Flathub..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Installing packages..."
echo "$PACKAGES" | xargs flatpak install flathub -y
echo "Flatpak packages installed."
