#!/bin/bash

SEVENZIP_VERSION="2603"
SEVENZIP_BASE="7z${SEVENZIP_VERSION}-linux-x64"
SEVENZIP_FILE="${SEVENZIP_BASE}.tar.xz"
SEVENZIP_DIR="$HOME/.7zip"
DOWNLOADS_DIR="$HOME/Downloads/Applications/7zip"

if command -v 7z >/dev/null 2>&1; then
    echo "You currently have 7zip installed!"
    exit 0
fi

cd "$DOWNLOADS_DIR" || exit 1

if [[ ! -f "$SEVENZIP_FILE" ]]; then
    echo "Download the .tar.xz file at https://www.7-zip.org/download.html"
    exit 1
fi

mkdir -p "$SEVENZIP_DIR"
tar -xvf "$SEVENZIP_FILE" -C "$SEVENZIP_DIR"
echo "7zip has been successfully installed!"
