#!/bin/sh

# Set the default cursor
xsetroot -cursor_name left_ptr

# Set the keyboard layout
setxkbmap -layout us -option

# Start the desktop environment
exec bspwm
