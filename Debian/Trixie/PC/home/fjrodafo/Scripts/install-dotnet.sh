#!/bin/bash

DOTNET_VERSION="10.0.201"
DOTNET_BASE="dotnet-sdk-${DOTNET_VERSION}-linux-x64"
DOTNET_FILE="${DOTNET_BASE}.tar.gz"
DOTNET_DIR="$HOME/.dotnet"
DOWNLOADS_DIR="$HOME/Downloads/Dev"

if command -v dotnet >/dev/null 2>&1; then
    echo "You currently have .NET installed!"
    exit 0
fi

cd "$DOWNLOADS_DIR"

if [[ ! -f "$DOTNET_FILE" ]]; then
    echo "Download de .tar.gz file at https://dotnet.microsoft.com/en-us/download/dotnet"
    exit 1
fi

mkdir -p "$DOTNET_DIR"
tar -xzvf "$DOTNET_FILE" -C "$DOTNET_DIR"
echo ".NET has been successfully installed!"
