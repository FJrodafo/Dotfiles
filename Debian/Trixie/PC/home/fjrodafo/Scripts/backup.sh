#!/bin/bash
set -euo pipefail

# Configuration
HOME_DIR="/home/fjrodafo"
HARD_DRIVE="/media/fjrodafo/TOSHIBA"

# Ask for password securely
read -s -p "Enter backup password: " ZIP_PASSWORD
echo
read -s -p "Confirm backup password: " ZIP_PASSWORD_CONFIRM
echo

if [[ "$ZIP_PASSWORD" != "$ZIP_PASSWORD_CONFIRM" ]]; then
    echo "Error: Passwords do not match."
    exit 1
fi

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
# gitconfig
zip -P "$ZIP_PASSWORD" -r gitconfig.zip .gitconfig
echo -e "${YELLOW}Saving gitconfig.zip${RESET}"
mv gitconfig.zip "$HARD_DRIVE"
# npmrc
zip -P "$ZIP_PASSWORD" -r npmrc.zip .npmrc
echo -e "${YELLOW}Saving npmrc.zip${RESET}"
mv npmrc.zip "$HARD_DRIVE"
# gem
zip -P "$ZIP_PASSWORD" -r gem.zip .gem/credentials
echo -e "${YELLOW}Saving gem.zip${RESET}"
mv gem.zip "$HARD_DRIVE"
# gnupg
zip -P "$ZIP_PASSWORD" -r gnupg.zip .gnupgbackup
echo -e "${YELLOW}Saving gnupg.zip${RESET}"
mv gnupg.zip "$HARD_DRIVE"
# m2
zip -P "$ZIP_PASSWORD" -r m2.zip .m2/settings.xml
echo -e "${YELLOW}Saving m2.zip${RESET}"
mv m2.zip "$HARD_DRIVE"
# ssh
zip -P "$ZIP_PASSWORD" -r ssh.zip .ssh
echo -e "${YELLOW}Saving ssh.zip${RESET}"
mv ssh.zip "$HARD_DRIVE"
# Disks
zip -P "$ZIP_PASSWORD" -r Disks.zip Disks
echo -e "${YELLOW}Saving Disks.zip${RESET}"
mv Disks.zip "$HARD_DRIVE"
# Documents
zip -P "$ZIP_PASSWORD" -r Documents.zip Documents
echo -e "${YELLOW}Saving Documents.zip${RESET}"
mv Documents.zip "$HARD_DRIVE"
# Downloads
zip -P "$ZIP_PASSWORD" -r Downloads.zip Downloads
echo -e "${YELLOW}Saving Downloads.zip${RESET}"
mv Downloads.zip "$HARD_DRIVE"
# Favorites
zip -P "$ZIP_PASSWORD" -r Favorites.zip Favorites
echo -e "${YELLOW}Saving Favorites.zip${RESET}"
mv Favorites.zip "$HARD_DRIVE"
# Music
zip -P "$ZIP_PASSWORD" -r Music.zip Music
echo -e "${YELLOW}Saving Music.zip${RESET}"
mv Music.zip "$HARD_DRIVE"
# Pictures
zip -P "$ZIP_PASSWORD" -r Pictures.zip Pictures
echo -e "${YELLOW}Saving Pictures.zip${RESET}"
mv Pictures.zip "$HARD_DRIVE"
# Public
zip -P "$ZIP_PASSWORD" -r Public.zip Public
echo -e "${YELLOW}Saving Public.zip${RESET}"
mv Public.zip "$HARD_DRIVE"
# Scripts
zip -P "$ZIP_PASSWORD" -r Scripts.zip Scripts
echo -e "${YELLOW}Saving Scripts.zip${RESET}"
mv Scripts.zip "$HARD_DRIVE"
# Templates
zip -P "$ZIP_PASSWORD" -r Templates.zip Templates
echo -e "${YELLOW}Saving Templates.zip${RESET}"
mv Templates.zip "$HARD_DRIVE"
# Temporary
zip -P "$ZIP_PASSWORD" -r Temporary.zip Temporary
echo -e "${YELLOW}Saving Temporary.zip${RESET}"
mv Temporary.zip "$HARD_DRIVE"
# Videos
zip -P "$ZIP_PASSWORD" -r Videos.zip Videos
echo -e "${YELLOW}Saving Videos.zip${RESET}"
mv Videos.zip "$HARD_DRIVE"
# Done!
echo -e "${GREEN}The backup has been successfully completed!${RESET}"
