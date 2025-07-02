#! /bin/bash

PWD=$(pwd)
CINNAMON_CONFIG_DIR="$HOME/.config/cinnamon"
echo "Copying desktop config..."

echo "Removing old config..."
rm -rf "$CINNAMON_CONFIG_DIR"

echo "Copying..."
dconf load / <"${PWD}/config/dconf"
cp -r "${PWD}/config/cinnamon" "$CINNAMON_CONFIG_DIR"

echo "Desktop config setup done."
