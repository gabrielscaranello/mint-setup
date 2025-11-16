#! /bin/bash

URL="https://sh.rustup.rs"

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf "$URL" | sh -s -- -y --default-toolchain stable --no-modify-path
source "$HOME/.cargo/env"
rustup default stable

echo "Rust installed."
