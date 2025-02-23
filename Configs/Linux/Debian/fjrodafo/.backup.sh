#!/bin/bash

read -p "Are you sure you want to backup? [Y/n]: " confirmation

if [ "$confirmation" != "Y" ]; then
    echo "Backup cancelled."
    exit 0
fi

if [ -e "/media/fjrodafo/TOSHIBA" ]; then
    # Backup
    zip -P 1234 -r backup.zip /home/fjrodafo/.backup.sh
    mv /home/fjrodafo/backup.zip /media/fjrodafo/TOSHIBA
    # Documents
    zip -P 1234 -r Documents.zip /home/fjrodafo/Documents
    mv /home/fjrodafo/Documents.zip /media/fjrodafo/TOSHIBA
    # Backup done!
    clear
    echo "The backup has been successfully completed!"
else
    echo "Error: External hard drive is not connected..."
    exit 1
fi
