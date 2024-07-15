#!/bin/bash

# Download de LTS .tar.xz file at https://nodejs.org/en and put the file in your Downloads folder
# Add the following command to the .bashrc file: export PATH=$PATH:$HOME/nodejs/bin

if node --version && npm --version; then
    clear && neofetch --ascii $HOME/Documents/Repos/Dotfiles/Configs/Neofetch/Ascii.txt
    echo "You currently have Nodejs installed!"
else
    clear && cd ~/Downloads
    # Check the version!
    tar -xf node-v18.17.1-linux-x64.tar.xz
    # Check the version!
    mv node-v18.17.1-linux-x64 ~/nodejs
    clear && neofetch --ascii $HOME/Documents/Repos/Dotfiles/Configs/Neofetch/Ascii.txt
    echo "Nodejs has been successfully installed!"
fi
