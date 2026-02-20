<div align = center>
<h2>Debian 13 (Trixie) PC Install</h2>
&ensp;<a href="https://debian.org/"><img src="https://raw.githubusercontent.com/FJrodafo/Dotfiles/main/Assets/SVG/Debian.svg" width="24" height="24" /></a>&ensp;
&ensp;<a href="https://github.com/FJrodafo/Dotfiles/blob/main/Configs/Linux/README.md"><kbd>Home</kbd></a>&ensp;
&ensp;<a href="https://github.com/FJrodafo/Dotfiles/blob/main/Configs/Linux/Debian/Trixie/PC/KEYBINDS.md"><kbd>Keybinds</kbd></a>&ensp;
&ensp;<a href="https://github.com/torvalds/linux"><img src="https://raw.githubusercontent.com/FJrodafo/Dotfiles/main/Assets/SVG/Linux.svg" width="24" height="24" /></a>&ensp;
<br />
</div>

## Index

1. [PC Specifications](#pc-specifications)
2. [Installation Process](#installation-process)
3. [sudo + Packages](#sudo--packages)
4. [bspwm + sxhkd](#bspwm--sxhkd)
5. [vscode + NVIDIA Drivers](#vscode--nvidia-drivers)
6. [User Directories Configuration](#user-directories-configuration)
7. [Mobile Device Detection](#mobile-device-detection)
8. [Fonts and Cursor Themes](#fonts-and-cursor-themes)
9. [Audio Setup](#audio-setup)
10. [AppImage Launcher](#appimage-launcher)
11. [Hiding Applications from Rofi](#hiding-applications-from-rofi)
12. [chroot](#chroot)
13. [Change a user's password](#change-a-users-password)

## PC Specifications

- **MOTHERBOARD:** Gigabyte B450M S2H
- **HEAT SINK:** Deepcool AK500 Zero Dark
- **CPU:** AMD Ryzen 7 5700X3D 3/4.1GHz
- **GPU:** ASUS Dual GeForce RTX 4060 Ti EVO OC Edition 16GB GDDR6
- **RAM:** Corsair Vengeance LPX DDR4 8GB 3000MHz - White
- **RAM:** Kingston FURY RGB DDR4 16GB
- **DISK:** Kingston A400 SSD 960GB
- **POWER:** Tacens Radix ECO III 650W
- **TOWER:** NOX Hummer Quantum ARGB
- **MONITOR:** ASUS VA24D Eye Care 24 inch LED IPS Frameless Full HD 1920x1080@75Hz Adaptative-Sync/FreeSync Low Blue Light Flicker Free VESA Wall Mountable
- **HEADSET:** Corsair HS35 Stereo Gaming Headset
- **MOUSE:** Corsair M55 Lightweight Gaming Mouse
- **KEYBOARD:** AJAZZ AK820 Side Engraved Black
- **GAMEPAD:** MSI Force GC20 V2 Controller Black

## Installation Process

- **Date:** 26/01/2026
- **Operating System (host):** Windows 11
- **Tool:** Balena Etcher
  - File: `balenaEtcher-2.1.4.Setup.exe`
- **Image:** Debian
  - File: `debian-13.3.0-amd64-netinst.iso`
- **USB Flash Drive:**
  - Model: HP v285w
  - Capacity: 16 GB

Once the ISO file is flashed on the USB drive, boot it on a PC without an NVIDIA graphics card.

- **Select a language:** English - English
- **Select your location**
    - **Country, territory or area:** other
    - **Continent or region:** Europe
    - **Country, territory or area:** Spain
- **Configure locales:** United States - en_US.UTF-8
- **Configure the keyboard:** American English
- **Configure the network**
    - **Hostname:** linux
    - **Domain name:** home
- **Set up users and passwords**
    - **Root password:** ****
    - **Full name for the new user:** Francisco Jose Rodriguez Afonso
    - **Username for your account:** fjrodafo
    - **Choose a password for the new user:** ****
- **Configure the clock:** Canary Islands
- **Partition disks**
    - **Partitioning method:** Guided - use entire disk
    - **Select disk to partition:** SCI1 (0,0,0) (sda) - 960.2 GB ATA KINGSTON SA400S3
    - **Partitioning scheme:** All files in one partition (recommended for new users)
    ```
            1.0 MB       FREE SPACE
    #1      1.0 GB    f  ESP
    #2    933.5 GB    f  ext4          /
    #3     25.7 GB    f  swap          swap
          335.4 KB       FREE SPACE
    ```
- **Configure the package manager**
    - **Debian archive mirror country:** Spain
    - **Debian archive mirror:** deb.debian.org
    - **HTTP proxy information (blank for none):** 
- **Software selection**
    - **Choose software to install:**
        ```
        [ ] Debian desktop environment
        [ ] ... GNOME
        [ ] ... Xfce
        [ ] ... GNOME Flaskback
        [ ] ... KDE Plasma
        [ ] ... Cinnamon
        [ ] ... MATE
        [ ] ... LXDE
        [ ] ... LXQT
        [ ] web server
        [ ] ssh server
        [*] standard system utilities
        [ ] Choose a Debian Blend for installation
        ```
- **Finish the installation**

## sudo + Packages

After completing the Debian installation, boot into the system and log in using your new user account.

Switch to the root user and update the package lists:

```shell
su
apt update
```

Install the packages from the official apt repository:

```shell
# Core System and Privilege Management
apt install sudo network-manager
# X11 Display Server and Initialization
apt install xinit xserver-xorg xorg
# Window Manager and Hotkeys
apt install bspwm sxhkd
# Networking and Remote Access
apt install openvpn openssh-client
# Development and Command-Line Utilities
apt install git nano curl tar zip unzip
# Multimedia, Audio, and Screenshots
apt install mpv alsa-utils feh maim
# Compositor
apt install picom
# Appearance and Theming
apt install lxappearance arc-theme papirus-icon-theme fonts-noto-color-emoji
# Desktop Applications
apt install kitty rofi firefox-esr thunar zathura qimgv libreoffice
```

Ensure `/usr/sbin` is included in the `PATH` and add the user to the `sudo` group:

```shell
export PATH="$PATH:/usr/sbin"
usermod -aG sudo fjrodafo
```

Exit the root session and log out to apply group changes:

```shell
exit
logout
```

## bspwm + sxhkd

Create the required configuration directories and copy the default example files:

```shell
mkdir -p ~/.config/bspwm ~/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod +x ~/.config/bspwm/bspwmrc
```

Create the `~/.xinitrc` file to start `bspwm` when launching X:

```shell
cat <<EOF > ~/.xinitrc
#!/bin/sh

# Set the default cursor
xsetroot -cursor_name left_ptr

# Set the keyboard layout
setxkbmap -layout us -option

# Start the desktop environment
exec bspwm
EOF
chmod +x ~/.xinitrc
```

Edit the sxhkd configuration file:

```shell
nano ~/.config/sxhkd/sxhkdrc
```

Minimal keybindings configuration:

```shell
# terminal emulator
super + Return
	kitty

# application/program launcher
super + {_,shift + }@space
	rofi -show {drun,run}
```

Start the graphical environment:

```shell
startx
```

## vscode + NVIDIA Drivers

Open `firefox-esr` and download the following files:

- Visual Studio Code (`.deb` package)
- NVIDIA proprietary driver (`.run` installer)

Navigate to the downloads directory and install VS Code:

```shell
cd ~/Downloads
sudo dpkg -i code_1.108.2-1769004815_amd64.deb
```

Make the NVIDIA installer executable:

```shell
chmod +x NVIDIA-Linux-x86_64-580.126.09.run
```

Create a blacklist file to disable the open-source `nouveau` driver:

```shell
sudo cat <<EOF > /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF
```

Verify that the `nouveau` module is not loaded:

```shell
lsmod | grep nouveau
```

Power off the system:

```shell
systemctl poweroff
```

Move the disk or system from a non-NVIDIA PC to the target PC with an NVIDIA GPU, then boot and log in.

Update the system and prepare the environment for driver compilation:

```shell
sudo apt update
sudo update-initramfs -u
sudo apt install linux-headers-$(uname -r)
ls /usr/src
sudo apt install build-essential
sudo apt install pkg-config libglvnd-dev
```

Run the NVIDIA installer:

```shell
cd ~/Downloads
sudo ./NVIDIA-Linux-x86_64-580.126.09.run
```

After installation, verify the driver:

```shell
nvidia-smi
```

Reboot the system to finalize the setup:

```shell
systemctl reboot
```

## User Directories Configuration

Update the standard user directories with:

```shell
xdg-user-dirs-update
```

This will create or refresh the directories like Desktop, Downloads, Documents, etc., based on your locale.

The following code is an example of the contents of `~/.config/user-dirs.dirs`

```ini
# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run.
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
# 
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_VIDEOS_DIR="$HOME/Videos"
```

The following code is an example of the contents of `user-dirs.locale`

```
en_US
```

This ensures the directories are named according to US English conventions.

## Mobile Device Detection

Install the necessary packages to detect and mount mobile devices (smartphones, tablets, etc.):

```shell
sudo apt update
sudo apt install mtp-tools gvfs gvfs-backends gvfs-fuse
```

Package details:

- `mtp-tools` - Tools for working with MTP (Media Transfer Protocol) devices.
- `gvfs`, `gvfs-backends`, `gvfs-fuse` - Virtual filesystem services to enable automatic mounting and integration of devices in the file manager.

Once installed, your mobile devices should be automatically detected and accessible via your file manager (e.g., Thunar).

## Fonts and Cursor Themes

Download and unzip your cursor theme into the `~/.icons` directory.

You can install fonts either **system-wide** or **user-specific**:

- **System-wide:** `/usr/local/share/fonts`
- **User-specific:** `~/.local/share/fonts` or `~/.fonts`

1. Download the font files (`.ttf` or `.otf`).
2. Copy them to one of the font directories above.
3. Ensure the files have correct permissions (`644` → `-rw-r--r--`), otherwise they may not be usable:
    ```shell
    chmod 644 /path/to/font.ttf
    ```
4. Update the font cache:
    ```shell
    fc-cache -v
    ```

## Audio Setup

Install and configure PipeWire as the audio server, along with Audio Firmware and ALSA support.

```shell
sudo apt update
sudo apt install pipewire pipewire-audio pipewire-jack
```

PipeWire provides low-latency audio and MIDI support, replacing PulseAudio.

Enable and start PipeWire services for the current user:

```shell
systemctl --user enable --now pipewire pipewire-pulse wireplumber
```

- **pipewire** - The core PipeWire daemon.
- **pipewire-pulse** - Provides PulseAudio compatibility.
- **wireplumber** - Session manager for PipeWire.

Check the status of the services:

```shell
systemctl --user status pipewire
systemctl --user status pipewire-pulse
systemctl --user status wireplumber
```

Install Audio Firmware and ALSA Configuration:

```shell
sudo apt install firmware-sof-signed alsa-ucm-conf
```

- **firmware-sof-signed** - Intel Sound Open Firmware for supported devices.
- **alsa-ucm-conf** - ALSA Use Case Manager configuration files for audio hardware.

This setup ensures low-latency, high-quality audio on Debian 13 with modern hardware.

## AppImage Launcher

```shell
sudo apt update
sudo apt install libfuse2t64
```

Create a `.desktop` file in `~/.local/share/applications/` to integrate the AppImage into your application menu:

```shell
nano ~/.local/share/applications/app.desktop
```

Example content:

```ini
[Desktop Entry]
Name=App
Comment=A short description.
Exec=/home/fjrodafo/Downloads/Applications/App/App.AppImage
Icon=/home/fjrodafo/Downloads/Applications/App/App.png
Terminal=false
Type=Application
Categories=Utility;
```

After saving, the AppImage will appear in your desktop environment’s application launcher.

## Hiding Applications from Rofi

Sometimes you may want to hide certain applications from appearing in Rofi’s application launcher. This can be done by adding `NoDisplay=true` to their `.desktop` files.

Copy the application .desktop files to your local applications folder:

```shell
cp /usr/share/applications/rofi*.desktop ~/.local/share/applications/
```

Edit the files to hide them:

```shell
nano ~/.local/share/applications/rofi.desktop
nano ~/.local/share/applications/rofi-theme-selector.desktop
```

Add the following line under `[Desktop Entry]`

```ini
NoDisplay=true
```

Similarly, you can hide specific terminal emulators from Rofi:

```shell
cp /usr/share/applications/debian-uxterm.desktop ~/.local/share/applications/
cp /usr/share/applications/debian-xterm.desktop ~/.local/share/applications/
```

Edit the files to hide them:

```shell
nano ~/.local/share/applications/debian-uxterm.desktop
nano ~/.local/share/applications/debian-xterm.desktop
```

Add the following line under `[Desktop Entry]`

```ini
NoDisplay=true
```

## chroot

This section describes how to create, configure, use, and remove a Debian Trixie chroot environment using `debootstrap` and `schroot`.

First, install the required tools. `debootstrap` is used to bootstrap a minimal Debian system, and `schroot` provides an easy way to manage and enter chroot environments.

```shell
sudo apt update
sudo apt install debootstrap schroot
```

Next, create the directory that will host the chroot filesystem and download a minimal Debian Trixie system into it using `debootstrap`. The `--arch=amd64` flag specifies the target architecture, and the Debian mirror is provided explicitly.

```shell
sudo debootstrap --arch=amd64 trixie /srv/chroots/trixie http://deb.debian.org/debian/
```

After the base system is installed, the chroot is tagged by creating the `/etc/debian_chroot` file inside the chroot. This tag is useful to clearly identify the environment when working inside the shell.

```shell
echo "trixie" | sudo tee /srv/chroots/trixie/etc/debian_chroot
```

Then, configure `schroot` by creating a configuration file under `/etc/schroot/chroot.d/`. This file defines the chroot name, description, filesystem location, allowed users, and chroot type.

```shell
sudo tee /etc/schroot/chroot.d/trixie.conf > /dev/null <<EOL
[trixie]
description=Debian 13 (Trixie)
directory=/srv/chroots/trixie
users=root
root-users=root
type=directory
setup.fstab=
EOL
```

To keep a consistent shell experience, the root user’s `.bashrc` file from the host system is copied into the chroot’s root home directory.

```shell
sudo cp /root/.bashrc /srv/chroots/trixie/root/.bashrc
```

Once everything is set up, you can enter the Debian Trixie chroot as the root user using schroot.

```shell
sudo schroot -c trixie --directory=/root
```

When you finish your work, simply exit the shell to return to the host system.

```shell
exit
```

If the chroot is no longer required, it can be safely removed by deleting its directory.

```shell
sudo rm -rf /srv/chroots/trixie
```

You can also list all available chroot environments at any time executing the following command:

```shell
schroot -l
```

# Change a user's password

Generate an SHA-512 hash of a password:

```shell
openssl passwd -6
```

Use a personalized salt:

```shell
openssl passwd -6 -salt ABC123
```

Then:

```shell
sudo usermod --password 'HASH' fjrodafo
```