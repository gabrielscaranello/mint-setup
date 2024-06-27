#! /bin/bash

PWD=$(pwd)

. $PWD/scripts/_utils.sh

_add_docker_repo() {
	echo "Adding Docker repo..."
	echo "Removing old files if exists..."
	sudo rm -rf /etc/apt/keyrings/docker.gpg /etc/apt/sources.list.d/docker.list

	echo "Adding Docker repo..."
	sudo install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	sudo chmod a+r /etc/apt/keyrings/docker.gpg
	echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

	echo "Docker repo added."
}

_add_golang_repo() {
	echo "Adding Golang repo..."
	echo "Removing old files if exists..."
	sudo add-apt-repository -r -y ppa:longsleep/golang-backports

	echo "Adding Golang repo..."
	sudo add-apt-repository -y ppa:longsleep/golang-backports

	echo "Golang repo added."
}

_add_onlyoffice_repo() {
	echo "Adding OnlyOffice repo..."
	echo "Removing old files if exists..."
	sudo rm -rf /etc/apt/sources.list.d/onlyoffice.list /usr/share/keyrings/onlyoffice.gpg

	echo "Adding OnlyOffice repo..."
	mkdir -p -m 700 ~/.gnupg
	gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
	chmod 644 /tmp/onlyoffice.gpg
	sudo chown root:root /tmp/onlyoffice.gpg
	sudo mv /tmp/onlyoffice.gpg /usr/share/keyrings/onlyoffice.gpg
	echo 'deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list

	echo "OnlyOffice repo added."
}

_add_papirus_repo() {
	echo "Adding Papirus repo..."
	echo "Removing old files if exists..."
	sudo add-apt-repository -r -y ppa:papirus/papirus

	echo "Adding Papirus repo..."
	sudo add-apt-repository -y ppa:papirus/papirus

	echo "Papirus repo added."
}

_add_spotify_repo() {
	echo "Adding Spotify repo..."
	echo "Removing old files if exists..."
	sudo rm -rf /etc/apt/trusted.gpg.d/spotify.gpg /etc/apt/sources.list.d/spotify.list

	echo "Adding Spotify repo..."
	curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

	echo "Spotify repo added."
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
_add_golang_repo
_add_onlyoffice_repo
_add_papirus_repo
_add_spotify_repo
_add_vscode_repo
install_nala
sudo nala update
echo "Missing deb repos added."
