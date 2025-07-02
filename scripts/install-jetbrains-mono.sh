#! /bin/bash

FILE_NAME="JetBrainsMono.zip"
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$FILE_NAME"
OUTPUT_DIR="/tmp/$FILE_NAME"
TMP_DIR="/tmp/JetBrainsMono"
FONT_DIR="$TMP_DIR/JetBrainsMonoNerdFont"
FONTS_TO_INSTALL="$FONT_DIR-Regular.ttf $FONT_DIR-Bold.ttf $FONT_DIR-Italic.ttf"
TARGET_DIR="$HOME/.fonts"

echo "Installing JetBrains Mono Nerd Font..."

echo "Cleaning up..."
rm -rf $OUTPUT_DIR $TMP_DIR

echo "Downloading..."
wget -c $DOWNLOAD_URL -O $OUTPUT_DIR >/dev/null

echo "Extracting..."
unzip $OUTPUT_DIR -d $TMP_DIR >/dev/null

echo "Installing fonts..."
mkdir -p "$TARGET_DIR"

for font in $FONTS_TO_INSTALL; do
  cp "$font" "$TARGET_DIR"
done

echo "Updating font cache..."
fc-cache -f >/dev/null

echo "JetBrains Mono Nerd Font installed."
