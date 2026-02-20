<div align = center>
<h2>Debian 13 (Trixie) Server Install</h2>
&ensp;<a href="https://debian.org/"><img src="https://raw.githubusercontent.com/FJrodafo/Dotfiles/main/Assets/SVG/Debian.svg" width="24" height="24" /></a>&ensp;
&ensp;<a href="https://github.com/FJrodafo/Dotfiles/blob/main/Configs/Linux/README.md"><kbd>Home</kbd></a>&ensp;
&ensp;<a href="https://github.com/torvalds/linux"><img src="https://raw.githubusercontent.com/FJrodafo/Dotfiles/main/Assets/SVG/Linux.svg" width="24" height="24" /></a>&ensp;
<br />
</div>

## Index

1. [Laptop Specifications](#laptop-specifications)
2. [Installation Process](#installation-process)
3. [sudo + Packages](#sudo--packages)
4. [neofetch](#neofetch)
5. [Docker](#docker)

## Laptop Specifications

- **HOST:** Acer Caltech
- **CPU:** Intel Celeron N3050 (2) @ 2.160GHz
- **GPU:** Intel Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx
- **RAM:** 1883MiB
- **RES:** 1366x768

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

Once the ISO file is flashed on the USB drive, boot it on your laptop (server).

- **Select a language:** English - English
- **Select your location**
    - **Country, territory or area:** other
    - **Continent or region:** Europe
    - **Country, territory or area:** Spain
- **Configure locales:** United States - en_US.UTF-8
- **Configure the keyboard:** Spanish
- **Configure the network**
    - **Hostname:** server
    - **Domain name:** home
- **Set up users and passwords**
    - **Root password:** ****
    - **Full name for the new user:** Francisco Jose Rodriguez Afonso
    - **Username for your account:** fjrodafo
    - **Choose a password for the new user:** ****
- **Configure the clock:** Canary Islands
- **Partition disks**
    - **Partitioning method:** Guided - use entire disk
    - **Select disk to partition:** MMC/SD card #1 (mmcblk0) - 31.3 GB MMC HBG4e
    - **Partitioning scheme:** All files in one partition (recommended for new users)
    ```
           1.0 MB       FREE SPACE
    #1     1.0 GB    F  ESP
    #2    28.6 GB    F  ext4          /
    #3     1.6 GB    F  swap          swap
           1.0 MB       FREE SPACE
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

Install the following packages from the official apt repository:

```shell
# Core System and Privilege Management
apt install sudo network-manager
# Remote Access
apt install openssh-server
# Development and Command-Line Utilities
apt install git nano curl tar zip unzip
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

## neofetch

```shell
sudo apt update
sudo apt install git build-essential
git https://github.com/dylanaraps/neofetch.git
cd neofetch
sudo make install
neofetch
```

## Docker

Run the following command to uninstall all conflicting packages:

```shell
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-doc podman-docker containerd runc | cut -f1)
```

`apt` might report that you have none of these packages installed.

Set up Docker's `apt` repository:

```shell
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "trixie")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
```

Install the Docker packages:

```shell
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

> [!NOTE]
> 
> The Docker service starts automatically after installation. To verify that Docker is running, use:
> 
> ```shell
> sudo systemctl status docker
> ```
> 
> Some systems may have this behavior disabled and will require a manual start:
> 
> ```shell
> sudo systemctl start docker
> ```

Verify that the installation is successful by running the `hello-world` image:

```shell
sudo docker run hello-world
```

To create the `docker` group and add your user:

1. Create the docker group.
    ```shell
    sudo groupadd docker
    ```
2. Add your user to the `docker` group.
    ```shell
    sudo usermod -aG docker fjrodafo
    ```
3. Log out and log back in so that your group membership is re-evaluated.
    ```txt
    If you're running Linux in a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.
    ```
4. Verify that you can run `docker` commands without `sudo`.
    ```shell
    docker run hello-world
    ```