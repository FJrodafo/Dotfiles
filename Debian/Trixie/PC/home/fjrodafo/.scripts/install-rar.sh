#!/bin/bash

RAR_VERSION="723"
RAR_BASE="rarlinux-x64-${RAR_VERSION}"
RAR_FILE="${RAR_BASE}.tar.gz"
RAR_DIR="$HOME/.rar"
DOWNLOADS_DIR="$HOME/Downloads/Applications/RAR"

if command -v rar >/dev/null 2>&1 && command -v unrar >/dev/null 2>&1; then
    echo "You currently have RAR installed!"
    exit 0
fi

cd "$DOWNLOADS_DIR" || exit 1

if [[ ! -f "$RAR_FILE" ]]; then
    echo "Download the .tar.gz file at https://www.win-rar.com/download.html"
    exit 1
fi

tar -xzf "$RAR_FILE"
mv rar "$RAR_DIR"
echo "RAR has been successfully installed!"
