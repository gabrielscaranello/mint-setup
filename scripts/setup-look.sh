#! /bin/bash

PWD=$(pwd)

echo "Setting up look..."
bash "${PWD}/scripts/setup-cursor-theme.sh"
bash "${PWD}/scripts/setup-gtk-theme.sh"
bash "${PWD}/scripts/setup-icon-theme.sh"
echo "Look setup done."
