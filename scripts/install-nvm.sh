#! /bin/bash

NODE_VERSION=20
NVM_VERSION=0.40.1
PACKAGES=$(cat "$PWD/node-packages" | tr '\n' ' ')

echo "Installing NVM and Node..."

echo "Installing NVM..."
wget -qO- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Installing Node ${NODE_VERSION}..."
nvm install "${NODE_VERSION}"

echo "Installing yarn..."
npm i -g yarn

echo "Installing node packages..."
yarn global add $PACKAGES

echo "NVM and Node installed."
