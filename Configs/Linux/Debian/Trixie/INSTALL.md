<div align = center>
<h2>Install Debian Trixie!</h2>
&ensp;<a href="https://debian.org/"><img src="https://raw.githubusercontent.com/FJrodafo/Dotfiles/main/Assets/SVG/Debian.svg" width="24" height="24" /></a>&ensp;
&ensp;<a href="./../README.md"><kbd>Home</kbd></a>&ensp;
&ensp;<a href="./KEYBINDS.md"><kbd>Keybinds</kbd></a>&ensp;
&ensp;<a href="https://github.com/torvalds/linux"><img src="https://raw.githubusercontent.com/FJrodafo/Dotfiles/main/Assets/SVG/Linux.svg" width="24" height="24" /></a>&ensp;
<br />
</div>

## Index

1. [Install](#install)

## Install

2026/01/26
USB Flash from Windows
balenaEtcher-2.1.4.Setup.exe
debian-13.3.0-amd64-netinst.iso
16GB USB v285w

## sudo + packages

USB booted into Laptop (any PC without an Nvidia graphics card)
Boot into Debian
Log in with your username and password

```shell
su
apt update

# Packages
apt install sudo network-manager
apt install xinit xserver-xorg xorg
apt install bspwm sxhkd
apt install openvpn openssh-client git nano curl tar zip unzip
apt install feh maim alsa-utils picom
apt install lxappearance arc-theme papirus-icon-theme fonts-noto-color-emoji
apt install qimgv mpv kitty rofi firefox-esr thunar zathura libreoffice qalculate-gtk

export PATH="$PATH:/usr/sbin"
usermod -aG sudo fjrodafo
exit
logout
```

## bspwm + sxhkd

```shell
mkdir -p ~/.config/bspwm ~/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod +x ~/.config/bspwm/bspwmrc
```

```shell
cat <<EOF > ~/.xinitrc
#!/bin/sh

# Prevent blank screen
xset s off
xset -dpms

# Start the desktop
exec bspwm
EOF
chmod +x ~/.xinitrc
```

`nano` para modificar `~/.config/sxhkd/sxhkdrc` con el siguiente contenido:

```shell
# terminal emulator
super + Return
	kitty

# program launcher
super + @space
	rofi -show drun
```

iniciamos el entorno grafico con el siguiente comando:

```shell
startx
```

## vscode + nvidia drivers

open firefox-esr to download vscode and nvidia drivers

```shell
cd Downloads
sudo dpkg -i code_1.108.2-1769004815_amd64.deb
chmod +x NVIDIA-Linux-x86_64-580.126.09.run
```

```shell
sudo cat <<EOF > /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF
```

```shell
systemctl poweroff
```

change from Laptop (any PC without an Nvidia graphics card) to your PC with an Nvidia graphics card and log in

```shell
sudo apt update
sudo update-initramfs -u
sudo apt install linux-headers-$(uname -r)
ls /usr/src
sudo apt install build-essential
sudo apt install pkg-config libglvnd-dev
lsmod | grep nouveau
cd Downloads
sudo ./NVIDIA-Linux-x86_64-580.126.09.run
nvidia-smi
systemctl reboot
```

### Avoid Screen Tearing

> /etc/X11/xorg.conf.d/20-nvidia.conf

```conf
Section "Screen"
    Identifier "Screen0"
    Device "Device0"
    Monitor "Monitor0"
    Option "ForceFullCompositionPipeline" "on"
    Option "AllowIndirectGLXProtocol" "off"
    Option "TripleBuffer" "on"
EndSection
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

## Fonts + Cursors

Install a font manually by downloading the appropriate .ttf or otf files and placing them into `/usr/local/share/fonts` (system-wide), `~/.local/share/fonts` (user-specific) or `~/.fonts` (user-specific). These files should have the permission 644 (-rw-r--r--), otherwise they may not be usable.

Run `fc-cache` to update the font cache (add `-v` for verbose output). The above mentioned paths can be customized in the fontconfig configuration file at `/etc/fonts/fonts.conf` – you can also include subdirectories or links, which is useful if you have a directory of fonts on a separate hard drive (or partition or other location).

To install cursors just unzip your cursors into `~/.icons`

## How to fix choppy YouTube video playback? Enable WebRender

When streaming videos on YouTube using `firefox-esr` and `firefox`, the video playback is choppy with an uneven frame-rate.

```
about:config
gfx.webrender.all true
```

## AppImage launcher

```shell
sudo apt update
sudo apt install libfuse2t64
```

> ~/.local/share/applications/app.desktop

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

## Hide rofi from rofi ?

Add `NoDisplay=true` to the following files:

```shell
cp /usr/share/applications/rofi*.desktop ~/.local/share/applications/
nano ~/.local/share/applications/rofi.desktop 
nano ~/.local/share/applications/rofi-theme-selector.desktop
```