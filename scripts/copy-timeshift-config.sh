#! /bin/bash

DOCUMENTS_DIR="Documents"
REPLACE_HOME='s,:home:,'"$HOME"',g'
USERS_DIR="$HOME/.config/user-dirs.dirs"
TIMESHIFT_CONFIG="/etc/timeshift/timeshift.json"

echo "Copying timeshift config..."

echo "Removing old files if exists..."
sudo rm -rf $TIMESHIFT_CONFIG

if [ -f "$USERS_DIR" ]; then
  DOCUMENTS_DIR="$(grep 'XDG_DOCUMENTS_DIR' "$USERS_DIR" | awk -F'/' '{print $NF}' | cut -d'"' -f1)"
fi

echo "Creating timeshift config..."
sed "$REPLACE_HOME" config/timeshift.json | sed 's,:documents_dir:,'"$DOCUMENTS_DIR"',g' | sudo tee $TIMESHIFT_CONFIG >/dev/null

echo "Timeshift config setup done."
