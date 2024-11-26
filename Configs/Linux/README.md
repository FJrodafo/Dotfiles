## Index

1. [Distro](#distro)
2. [Sudo](#sudo)
3. [Packages](#packages)
4. [TTY Config](#tty-config)
5. [Drivers NVIDIA](#drivers-nvidia)
6. [Avoid Screen Tearing NVIDIA](#avoid-screen-tearing-nvidia)
7. [Desktop](#desktop)
8. [Fonts](#fonts)
9. [Rofi Emoji Selector](#rofi-emoji-selector)
10. [EWW](#eww)
11. [Audio](#audio)
12. [startx Intel Laptop](#startx-intel-laptop)

## Distro

[Debian 12.8.0](https://www.debian.org/)

## Sudo

```sh
su
apt update
apt upgrade -y
apt install login passwd sudo systemd-sysv
echo $PATH
export PATH=$PATH:/usr/sbin
usermod -aG sudo fjrodafo
exit
systemctl reboot
```

## Packages

```sh
sudo apt update
sudo apt upgrade -y

sudo apt install login passwd sudo network-manager bluez systemd-sysv build-essential pkg-config libglvnd-dev openssh-client neofetch xorg xinit nano curl git bspwm sxhkd picom feh maim kitty rofi rofi-dev autoconf automake libtool-bin libtool xsel xclip copyq xdotool fonts-noto-color-emoji firefox-esr vlc thunar mtp-tools gvfs gvfs-backends gvfs-fuse zip cava cbonsai cmatrix htop libreoffice pipewire pipewire-jack pipewire-jack pipewire-audio firmware-sof-signed alsa-ucm-conf
```

## TTY Config

To adjust the font/font-size used for the TTY, run `sudo dpkg-reconfigure console-setup`, which will guide you through the steps to choose a font and font-size:

1. Choose the default `UTF-8`, and press `Tab` to go highlight OK and then press `Enter` to go to the next step. (You can press it again and highlight `Cancel` to go back.)
2. Choose the default `. Combined - Latin; Slavic Cyrillic; Greek` option ("Latin" includes the English alphabet) and proceed to step 3:
3. Choose the default `Fixed`, be sure to read the notes above on the visual effect different fonts can have. 
4. Choose the default `16`.

## Drivers NVIDIA

```sh
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

```sh
sudo update-initramfs -u
sudo apt install linux-headers-$(uname -r)
ls /usr/src
sudo apt install pkg-config libglvnd-dev
sudo reboot
lsmod | grep nouveau
sudo ./NVIDIA-Linux-x86_64-<version>.run

# Show results
nvidia-smi
```

```sh
# 32Bit Compatibility

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libc6:i386 libgl1-mesa-glx:i386 libglu1-mesa:i386
sudo ./NVIDIA-Linux-x86_64-<version>.run
```

## Avoid Screen Tearing NVIDIA

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

```sh
touch ~/.xinitrc
nano ~/.xinitrc
```

> .xinitrc
```sh
#!/bin/sh

xset s off
xset -dpms

exec bspwm
```

```sh
chmod +x ~/.xinitrc

# Run bspwm
startx
```

## File Manager Mobile Detection

```sh
sudo apt update
sudo apt install mtp-tools gvfs gvfs-backends gvfs-fuse
```

## Fonts

Install a font manually by downloading the appropriate .ttf or otf files and placing them into `/usr/local/share/fonts` (system-wide), `~/.local/share/fonts` (user-specific) or `~/.fonts` (user-specific). These files should have the permission 644 (-rw-r--r--), otherwise they may not be usable.

Run `fc-cache` to update the font cache (add `-v` for verbose output). The above mentioned paths can be customized in the fontconfig configuration file at `/etc/fonts/fonts.conf` – you can also include subdirectories or links, which is useful if you have a directory of fonts on a separate hard drive (or partition or other location).

## Rofi Emoji Selector

```sh
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

## EWW

```sh
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Dependencies
sudo apt update
sudo apt install libcairo2-dev libatk1.0-dev libgdk-pixbuf2.0-dev librust-gdk+v3-24-dev libdbusmenu-glib-dev libdbusmenu-gtk3-dev pkg-config

# Install EWW
git clone https://github.com/elkowar/eww.git
cd eww
cargo build --release --no-default-features --features x11

# Running EWW
cd target/release
chmod +x ./eww
./eww daemon
./eww open --toggle powermenu
```

## Audio

```sh
sudo apt update
sudo apt install pipewire pipewire-jack pipewire-jack pipewire-audio

systemctl --user enable --now pipewire pipewire-pulse wireplumber

systemctl --user status pipewire
systemctl --user status pipewire-pulse
systemctl --user status wireplumber

sudo apt install firmware-sof-signed alsa-ucm-conf
```

## startx Intel Laptop

> /etc/X11/xorg.conf

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

```sh
sudo X -configure
sudo mv xorg.conf.new /etc/X11/xorg.conf
```

<link rel="stylesheet" href="./README.css">
<a class="scrollup" href="#top">&#x1F53C</a>