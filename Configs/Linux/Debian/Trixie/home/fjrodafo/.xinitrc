#!/bin/sh

# Change cursor
xsetroot -cursor_name left_ptr

# Keyboard layout
setxkbmap -layout us,es -option grp:toggle

# Start the desktop
exec bspwm
