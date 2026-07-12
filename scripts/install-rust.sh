#! /bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/cargo-packages")
URL="https://sh.rustup.rs"

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf "$URL" | sh -s -- -y --default-toolchain stable --no-modify-path
source "$HOME/.cargo/env"
rustup default stable

echo "Installing cargo packages..."
echo "$PACKAGES" | xargs cargo install
echo "Cargo packages installed."

echo "Rust installed."
