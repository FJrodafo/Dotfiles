#!/bin/bash

if sqlite3 --version; then
    echo "You currently have SQLite3 installed!"
else
    clear && cd ~/Downloads
    # Check the version!
    wget https://www.sqlite.org/2025/sqlite-autoconf-3490100.tar.gz
    # Check the version!
    tar -xzvf sqlite-autoconf-3490100.tar.gz
    # Check the version!
    mv sqlite-autoconf-3490100 ~/.sqlite
    clear && cd ~
    echo "SQLite3 has been successfully installed!"
fi
