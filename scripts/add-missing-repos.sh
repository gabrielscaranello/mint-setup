#! /bin/bash

PWD=$(pwd)

_add_vscode_repo() {
  echo "Adding VSCode repo..."
  echo "Removing old files if exists..."
  sudo rm -rf /etc/apt/sources.list.d/vscode.sources /usr/share/keyrings/microsoft.gpg

  echo "Adding VSCode repo..."
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
  cat << EOF | sudo tee /etc/apt/sources.list.d/vscode.sources > /dev/null
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

  rm -f microsoft.gpg
  echo "VSCode repo added."
}

echo "Adding missing deb repos..."
_add_vscode_repo

sudo apt update
echo "Missing deb repos added."
