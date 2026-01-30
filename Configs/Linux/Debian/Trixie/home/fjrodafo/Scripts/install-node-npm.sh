#!/bin/bash

NODEJS_VERSION="v24.13.0"
NODEJS_BASE="node-${NODEJS_VERSION}-linux-x64"
NODEJS_FILE="${NODEJS_BASE}.tar.xz"
NODEJS_DIR="$HOME/.nodejs"
DOWNLOADS_DIR="$HOME/Downloads"

if command -v node >/dev/null 2>&1 && command -v npm >/dev/null 2>&1; then
    echo "You currently have Nodejs installed!"
    exit 0
fi

cd "$DOWNLOADS_DIR"

if [[ ! -f "$NODEJS_FILE" ]]; then
    echo "Download de .tar.xz file at https://nodejs.org/en"
    exit 1
fi

tar -xf "$NODEJS_FILE"
mv "$NODEJS_BASE" "$NODEJS_DIR"
echo "Nodejs has been successfully installed!"
