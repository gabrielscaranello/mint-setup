#! /bin/bash

PWD=$(pwd)

_add_docker_repo() {
  echo "Adding Docker repo..."
  echo "Removing old files if exists..."
  sudo rm -rf /etc/apt/keyrings/docker.gpg /etc/apt/sources.list.d/docker.list

  echo "Adding Docker repo..."
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg
  echo "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

  echo "Docker repo added."
}

_add_papirus_repo() {
  echo "Adding Papirus repo..."
  echo "Removing old files if exists..."
  sudo add-apt-repository -r -y ppa:papirus/papirus

  echo "Adding Papirus repo..."
  sudo add-apt-repository -y ppa:papirus/papirus

  echo "Papirus repo added."
}

_add_vscode_repo() {
  echo "Adding VSCode repo..."
  echo "Removing old files if exists..."
  sudo rm -rf /etc/apt/sources.list.d/vscode.list /etc/apt/keyrings/packages.microsoft.gpg

  echo "Adding VSCode repo..."
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg
  echo "VSCode repo added."
}

echo "Adding missing deb repos..."
_add_docker_repo
_add_papirus_repo
_add_vscode_repo
sudo apt update
echo "Missing deb repos added."
