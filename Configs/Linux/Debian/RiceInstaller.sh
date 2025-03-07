#!/bin/bash

#  ╦═╗┬┌─┐┌─┐  ╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┌─┐┬─┐
#  ╠╦╝││  ├┤   ║│││└─┐ │ ├─┤│  │  ├┤ ├┬┘
#  ╩╚═┴└─┘└─┘  ╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘└─┘┴└─

# Author: Francisco José Rodríguez Afonso
# E-mail: FJrodafo@gmail.com
# GitHub: https://github.com/FJrodafo
# Website: https://fjrodafo.vercel.app

echo Author: Francisco José Rodríguez Afonso
echo E-mail: FJrodafo@gmail.com
echo GitHub: https://github.com/FJrodafo
echo Website: https://fjrodafo.vercel.app

# Update system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install essential packages
echo "Installing essential packages..."
sudo apt install -y login passwd sudo openvpn openssh-client git systemd-sysv build-essential nano curl zip pkg-config libglvnd-dev xorg xserver-xorg-input-libinput xinit bspwm sxhkd picom feh maim gimp vlc mpv cava pipewire pipewire-jack pipewire-audio firmware-sof-signed alsa-ucm-conf alsa-utils brightnessctl qimgv zathura thunar mtp-tools gvfs gvfs-backends gvfs-fuse fonts-noto-color-emoji rofi rofi-dev autoconf automake libtool-bin libtool xsel xclip copyq xdotool libcairo2-dev libatk1.0-dev libgdk-pixbuf2.0-dev librust-gdk+v3-24-dev libdbusmenu-glib-dev libdbusmenu-gtk3-dev network-manager bluez firefox-esr neofetch kitty libreoffice lxappearance arc-theme papirus-icon-theme qalculate-gtk xorg-dev libx11-dev x11proto-xext-dev libxrender-dev libxext-dev
echo "Package installation complete!"

# Desktop environment set up (bspwm + sxhkd)
echo "Setting up the desktop environment..."
touch ~/.xinitrc
echo -e '#!/bin/sh\n\nxset s off\nxset -dpms\nxsetroot -cursor_name left_ptr\nexec bspwm' > ~/.xinitrc
chmod +x ~/.xinitrc
echo "Desktop environment setup complete!"

# Install audio management (Pipewire)
echo "Installing audio management..."
systemctl --user enable --now pipewire pipewire-pulse wireplumber
systemctl --user status pipewire
systemctl --user status pipewire-pulse
systemctl --user status wireplumber
echo "Audio configuration complete!"

# Wifi set up
echo "Setting up Wifi..."
sudo systemctl status NetworkManager
nmcli dev wifi list
echo "Wifi setup complete!"

# Install EWW (ElKowar's Wacky Widgets)
echo "Installing EWW (ElKowar's Wacky Widgets)..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/elkowar/eww.git
cd eww
cargo build --release --no-default-features --features x11
chmod +x target/release/.eww
echo "EWW installation complete!"

# Finish and reboot!
echo "RiceInstaller.sh has finished running!"
echo "Please reboot your system now."
sudo systemctl reboot
