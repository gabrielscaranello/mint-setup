CURSOR_NAME="Bibata-Modern-Ice"

echo "Installing Bibata cursor..."

# Set cursor
gsettings set org.cinnamon.desktop.interface cursor-theme "$CURSOR_NAME"
gsettings set org.cinnamon.desktop.interface cursor-size 20

echo "Bibata cursor installed"
