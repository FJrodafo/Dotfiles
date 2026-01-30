#!/bin/sh

# Change cursor
xsetroot -cursor_name left_ptr

# Keyboard layout
setxkbmap -layout us -option

# Start the desktop
exec bspwm
