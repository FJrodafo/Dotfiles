#!/bin/bash

sudo update-initramfs -u
sudo apt install linux-headers-$(uname -r)
ls /usr/src

echo -e '\nRun ---> \033[1msudo\033[0m ./NVIDIA-Linux-x86_64-<version>.run'
echo -e '\nThen --> \033[1msystemctl\033[0m reboot'
