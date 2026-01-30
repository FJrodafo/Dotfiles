#!/bin/bash

sudo X -configure
sudo mv /root/xorg.conf.new /etc/X11/xorg.conf
startx
