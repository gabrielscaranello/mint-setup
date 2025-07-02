#! /bin/bash

GIT_URL="https://github.com/neovim/neovim"
BRANCH="stable"
WORK_DIR="/tmp/neovim"

echo "Installing Neovim..."

echo "Removing old files if exists..."
rm -rf $WORK_DIR

echo "Cloning Neovim..."
git clone --depth 1 -b "$BRANCH" "$GIT_URL" "$WORK_DIR"

# Install
echo "Installing..."
cd "$WORK_DIR" && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux-x86_64.deb && cd "$WORK_DIR" || exit

echo "Neovim installed..."
