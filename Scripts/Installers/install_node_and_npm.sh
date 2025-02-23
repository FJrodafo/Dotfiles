#!/bin/bash

# Download de LTS .tar.xz file at https://nodejs.org/en and put the file in your Downloads folder
# Add the following command to the .bashrc file: export PATH=$PATH:$HOME/.nodejs/bin

if node --version && npm --version; then
    echo "You currently have Nodejs installed!"
else
    clear && cd ~/Downloads
    # Check the version!
    tar -xf node-v22.14.0-linux-x64.tar.xz
    # Check the version!
    mv node-v22.14.0-linux-x64 ~/.nodejs
    clear && cd ~
    echo "Nodejs has been successfully installed!"
fi
