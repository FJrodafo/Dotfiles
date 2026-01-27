#!/bin/bash
set -euo pipefail

# Configuration
HOME_DIR="/home/fjrodafo"
HARD_DRIVE="/media/fjrodafo/TOSHIBA"
ZIP_PASSWORD="1234"

# Colors
RESET="\e[0m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"

# Confirmation
read -r -p "Are you sure you want to backup? [Y/n]: " confirmation

if [[ "$confirmation" != "Y" ]]; then
    echo -e "${RED}Backup cancelled.${RESET}"
    exit 0
fi

if [[ ! -e "$HARD_DRIVE" ]]; then
    echo -e "${RED}Error: External hard drive is not connected.${RESET}"
    exit 1
fi

cd "$HOME_DIR"
# backup
zip -P "$ZIP_PASSWORD" -r backup.zip .backup.sh
echo -e "${YELLOW}Moving backup.zip${RESET}"
mv backup.zip "$HARD_DRIVE"
# Documents
zip -P "$ZIP_PASSWORD" -r Documents.zip Documents
echo -e "${YELLOW}Moving Documents.zip${RESET}"
mv Documents.zip "$HARD_DRIVE"
# Done!
echo -e "${GREEN}The backup has been successfully completed!${RESET}"
