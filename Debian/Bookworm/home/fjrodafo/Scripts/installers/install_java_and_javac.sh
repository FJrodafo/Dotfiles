#!/bin/bash

# Download de LTS .deb file at https://www.oracle.com/java/technologies/downloads/ and put the file in your Downloads folder

if java --version && javac --version; then
    echo "You currently have Java installed!"
else
    clear && cd ~/Downloads
    # Check the version!
    sudo dpkg -i jdk-17_linux-x64_bin.deb
    # Check the version!
    sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-17/bin/java 1
    # Check the version!
    sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-17/bin/javac 1
    # Fix broken dependencies
    sudo apt install -fy
    clear && cd ~
    echo "Java has been successfully installed!"
fi
