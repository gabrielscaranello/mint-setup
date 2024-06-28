#! /bin/bash

echo "Setting up GTK Theme..."

echo "Removing old files if exists..."
sudo rm -rf /usr/share/themes/Colloid-*
rm -rf ~/.themes/Colloid-*
rm -rf /tmp/gtk-theme
rm -rf ~/.config/gtk-4.0

echo "Cloning GTK Theme..."
git clone https://github.com/vinceliuice/Colloid-gtk-theme.git /tmp/gtk-theme

echo "Installing GTK Theme..."
bash -c "cd /tmp/gtk-theme && ./install.sh -c dark -s standard -l fixed --tweaks catppuccin black rimless"
sudo mv ~/.themes/Colloid-* /usr/share/themes

echo "Linking GTK-4.0 Theme..."
mkdir -p ~/.config/gtk-4.0
ln -fs /usr/share/themes/Colloid-Dark-Catppuccin/gtk-4.0/assets ~/.config/gtk-4.0/assets
ln -fs /usr/share/themes/Colloid-Dark-Catppuccin/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
ln -fs /usr/share/themes/Colloid-Dark-Catppuccin/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css

echo "Defining GTK Theme..."
gsettings set org.cinnamon.desktop.interface gtk-theme "Colloid-Dark-Catppuccin"
gsettings set org.cinnamon.desktop.wm.preferences theme "Colloid-Dark-Catppuccin"
gsettings set org.cinnamon.theme name "Colloid-Dark-Catppuccin"
gsettings set org.cinnamon.desktop.interface color-scheme 'prefer-dark'

echo "GTK Theme setup done."
