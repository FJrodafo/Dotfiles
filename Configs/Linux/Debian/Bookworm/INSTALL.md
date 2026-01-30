<div align = center>
<h2>Install Debian Bookworm!</h2>
&ensp;<a href="https://debian.org/"><img src="https://raw.githubusercontent.com/FJrodafo/Dotfiles/main/Assets/SVG/Debian.svg" width="24" height="24" /></a>&ensp;
&ensp;<a href="./../../README.md"><kbd>Home</kbd></a>&ensp;
&ensp;<a href="./KEYBINDS.md"><kbd>Keybinds</kbd></a>&ensp;
&ensp;<a href="https://github.com/torvalds/linux"><img src="https://raw.githubusercontent.com/FJrodafo/Dotfiles/main/Assets/SVG/Linux.svg" width="24" height="24" /></a>&ensp;
<br />
</div>

## Index

1. [Sudo](#sudo)
2. [Packages](#packages)
3. [Portable Linux](#portable-linux)
4. [TTY Configuration](#tty-configuration)
5. [NVIDIA Drivers](#nvidia-drivers)
6. [Avoid Screen Tearing](#avoid-screen-tearing)
7. [Desktop](#desktop)
8. [Audio](#audio)
9. [Mobile Detection](#mobile-detection)
10. [Fonts](#fonts)
11. [Rofi Emoji Selector](#rofi-emoji-selector)
12. [EWW (ElKowar's Wacky Widgets)](#eww-elkowars-wacky-widgets)
13. [startx Intel Laptop](#startx-intel-laptop)
14. [Laptop Touchpad](#laptop-touchpad)
15. [Wifi](#wifi)
16. [How to fix choppy YouTube video playback? Enable WebRender](#how-to-fix-choppy-youtube-video-playback-enable-webrender)
17. [Open Broadcaster Software](#open-broadcaster-software)
18. [Animated Wallpaper](#animated-wallpaper)
19. [bsp-layout](#bsp-layout)
20. [How to extract 7z files](#how-to-extract-7z-files)
21. [AppImage launcher](#appimage-launcher)
22. [chroot](#chroot)

## Sudo

```shell
su
apt update
apt install login passwd sudo systemd-sysv
echo $PATH
export PATH=$PATH:/usr/sbin
usermod -aG sudo fjrodafo
exit
systemctl reboot
```

## Packages

```shell
sudo apt update
sudo apt upgrade -y

sudo apt install -y login passwd sudo openvpn openssh-client git nginx php-fpm systemd-sysv build-essential nano curl zip pkg-config libglvnd-dev xorg xserver-xorg-input-libinput xinit bspwm sxhkd picom feh maim gimp vlc mpv cava pipewire pipewire-jack pipewire-audio firmware-sof-signed alsa-ucm-conf alsa-utils brightnessctl qimgv zathura thunar mtp-tools gvfs gvfs-backends gvfs-fuse fonts-noto-color-emoji rofi rofi-dev autoconf automake libtool-bin libtool xsel xclip copyq xdotool libcairo2-dev libatk1.0-dev libgdk-pixbuf2.0-dev librust-gdk+v3-24-dev libdbusmenu-glib-dev libdbusmenu-gtk3-dev network-manager bluez firefox-esr neofetch kitty libreoffice lxappearance arc-theme papirus-icon-theme qalculate-gtk xorg-dev libx11-dev x11proto-xext-dev libxrender-dev libxext-dev bash bspc bc man debootstrap schroot

sudo apt autoremove
sudo apt install -f
```

## Portable Linux

```shell
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub --recheck --removable
```

## TTY Configuration

To adjust the font/font-size used for the TTY, run `sudo dpkg-reconfigure console-setup`, which will guide you through the steps to choose a font and font-size:

1. Choose the default `UTF-8`, and press `Tab` to go highlight OK and then press `Enter` to go to the next step. (You can press it again and highlight `Cancel` to go back.)
2. Choose the default `. Combined - Latin; Slavic Cyrillic; Greek` option ("Latin" includes the English alphabet) and proceed to step 3:
3. Choose the default `Fixed`, be sure to read the notes above on the visual effect different fonts can have. 
4. Choose the default `16`.

## NVIDIA Drivers

```shell
# Download drivers from NVIDIA website
chmod +x NVIDIA-Linux-x86_64-550.135.run
pkill Xorg
sudo apt update
sudo apt install build-essential
sudo nano /etc/modprobe.d/blacklist-nouveau.conf
```

> /etc/modprobe.d/blacklist-nouveau.conf

```conf
blacklist nouveau
options nouveau modeset=0
```

```shell
sudo update-initramfs -u
sudo apt install linux-headers-$(uname -r)
ls /usr/src
sudo apt install pkg-config libglvnd-dev
systemctl reboot
lsmod | grep nouveau
sudo ./NVIDIA-Linux-x86_64-<version>.run
nvidia-smi
```

```shell
# 32Bit Compatibility
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libc6:i386 libgl1-mesa-glx:i386 libglu1-mesa:i386
sudo ./NVIDIA-Linux-x86_64-<version>.run
```

## Avoid Screen Tearing

> /etc/X11/xorg.conf.d/20-nvidia.conf

```conf
Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    Option         "ForceFullCompositionPipeline" "on"
    Option         "AllowIndirectGLXProtocol" "off"
    Option         "TripleBuffer" "on"
EndSection
```

## Desktop

```shell
touch ~/.xinitrc
nano ~/.xinitrc
```

> .xinitrc

```shell
#!/bin/sh

# Prevent blank screen
xset s off
xset -dpms

# Change cursor
xsetroot -cursor_name left_ptr

# Start the desktop
exec bspwm
```

```shell
chmod +x ~/.xinitrc
startx
```

## Audio

```shell
sudo apt update
sudo apt install pipewire pipewire-jack pipewire-audio

systemctl --user enable --now pipewire pipewire-pulse wireplumber

systemctl --user status pipewire
systemctl --user status pipewire-pulse
systemctl --user status wireplumber

sudo apt install firmware-sof-signed alsa-ucm-conf
```

## Mobile Detection

```shell
sudo apt update
sudo apt install mtp-tools gvfs gvfs-backends gvfs-fuse
```

## Fonts

Install a font manually by downloading the appropriate .ttf or otf files and placing them into `/usr/local/share/fonts` (system-wide), `~/.local/share/fonts` (user-specific) or `~/.fonts` (user-specific). These files should have the permission 644 (-rw-r--r--), otherwise they may not be usable.

Run `fc-cache` to update the font cache (add `-v` for verbose output). The above mentioned paths can be customized in the fontconfig configuration file at `/etc/fonts/fonts.conf` – you can also include subdirectories or links, which is useful if you have a directory of fonts on a separate hard drive (or partition or other location).

## Rofi Emoji Selector

```shell
sudo apt update

# Emoji font
sudo apt install fonts-noto-color-emoji

# Dependencies
sudo apt install rofi-dev autoconf automake libtool-bin libtool
sudo apt install xsel xclip copyq xdotool

# Plugin files
https://github.com/Mange/rofi-emoji/archive/refs/tags/v3.4.1.zip

# Compile
cd rofi-emoji-3.4.1/
autoreconf -i
mkdir build
cd build/
../configure
make
sudo make install

# Warning
sudo libtool --finish /usr/lib/x86_64-linux-gnu/rofi//

# Final step
rofi -show emoji
```

## EWW (ElKowar's Wacky Widgets)

```shell
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Dependencies
sudo apt update
sudo apt install libcairo2-dev libatk1.0-dev libgdk-pixbuf2.0-dev librust-gdk+v3-24-dev libdbusmenu-glib-dev libdbusmenu-gtk3-dev pkg-config

# Install EWW
git clone https://github.com/elkowar/eww.git
mv eww .eww
cd .eww
cargo build --release --no-default-features --features x11

# Running EWW
cd target/release
chmod +x ./.eww
./.eww daemon
./.eww open --toggle power-menu
```

## startx Intel Laptop

```shell
su
cd
X -configure
mv xorg.conf.new /etc/X11/xorg.conf
exit
startx
```

> /etc/X11/xorg.conf.nvidia-xconfig-original

```conf
# nvidia-xconfig: X configuration file generated by nvidia-xconfig
# nvidia-xconfig:  version 550.135


Section "ServerLayout"
    Identifier     "Layout0"
    Screen      0  "Screen0" 0 0
    InputDevice    "Keyboard0" "CoreKeyboard"
    InputDevice    "Mouse0" "CorePointer"
EndSection

Section "Files"
EndSection

Section "InputDevice"

    # generated from default
    Identifier     "Mouse0"
    Driver         "mouse"
    Option         "Protocol" "auto"
    Option         "Device" "/dev/psaux"
    Option         "Emulate3Buttons" "no"
    Option         "ZAxisMapping" "4 5"
EndSection

Section "InputDevice"

    # generated from default
    Identifier     "Keyboard0"
    Driver         "kbd"
EndSection

Section "Monitor"
    Identifier     "Monitor0"
    VendorName     "Unknown"
    ModelName      "Unknown"
    Option         "DPMS"
EndSection

Section "Device"
    Identifier     "Device0"
    Driver         "nvidia"
    VendorName     "NVIDIA Corporation"
EndSection

Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    DefaultDepth    24
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection
```

## Laptop Touchpad

```shell
sudo apt update
sudo apt install xserver-xorg-input-libinput
sudo nano /etc/X11/xorg.conf.d/40-libinput.conf
```

> /etc/X11/xorg.conf.d/40-libinput.conf

```conf
Section "InputClass"
    Identifier "libinput touchpad catchall"
    MatchIsTouchpad "on"
    Driver "libinput"
    Option "Tapping" "on"
    Option "NaturalScrolling" "false"
    Option "ClickMethod" "clickfinger"
    Option "HorizontalScrolling" "true"
EndSection
```

## Wifi

```shell
sudo apt update
sudo apt install network-manager
sudo systemctl status NetworkManager
nmcli dev wifi list
nmcli dev wifi connect "SSID" password "PASSWORD"
```

## How to fix choppy YouTube video playback? Enable WebRender

When streaming videos on YouTube using `firefox-esr` and `firefox`, the video playback is choppy with an uneven frame-rate.

```
about:config
gfx.webrender.all true
```

## Open Broadcaster Software

```shell
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install ffmpeg obs-studio
```

## Animated Wallpaper

```shell
# Installing
sudo apt install xorg-dev build-essential libx11-dev x11proto-xext-dev libxrender-dev libxext-dev
git clone https://github.com/ujjwal96/xwinwrap.git
cd xwinwrap
make
sudo make install
make clean

# Run it!
xwinwrap -fs -fdt -ni -b -nf -un -o 1.0 -debug -- mpv -wid WID --loop --no-audio "$(find ~/Videos/Wallpapers/ -type f | shuf -n 1)"

# Kill it!
pkill -f xwinwrap
```

## bsp-layout

```shell
# Installing
sudo apt install bash bspc bc man
git clone https://github.com/phenax/bsp-layout.git
sudo make install

# Run it!
bsp-layout help

# Kill it!
sudo make uninstall
```

## How to extract 7z files

```shell
# Install
sudo apt install p7zip-full

# Then to extract the file
7za x yourfile.7z
```

## AppImage launcher

```shell
nano ~/.local/share/applications/app.desktop
```

```desktop
[Desktop Entry]
Name=App
Comment=App.
Exec=/home/fjrodafo/Downloads/App.AppImage
Icon=/home/fjrodafo/Downloads/App.png
Terminal=false
Type=Application
Categories=Utility;
```

## chroot

```shell
# Install
sudo apt install debootstrap schroot

# Create dir
sudo mkdir -p /srv/chroots/bookworm

# Download & install the system
sudo debootstrap --arch=amd64 bookworm /srv/chroots/bookworm http://deb.debian.org/debian/

# Tag the system
echo "bookworm" | sudo tee /srv/chroots/bookworm/etc/debian_chroot

# schroot config
sudo tee /etc/schroot/chroot.d/bookworm.conf > /dev/null <<EOL
[bookworm]
description=Debian Bookworm
directory=/srv/chroots/bookworm
users=root
root-users=root
type=directory
setup.fstab=
EOL

# Copy .bashrc from root to chroot
sudo cp /root/.bashrc /srv/chroots/bookworm/root/.bashrc

# Log in chroot bookworm as root
sudo schroot -c bookworm --directory=/root

# Exit chroot bookworm
exit

# Delete chroot bookworm
sudo rm -rf /srv/chroots/bookworm

# List available chroots
schroot -l
```