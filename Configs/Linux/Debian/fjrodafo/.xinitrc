#!/bin/sh

# Prevent blank screen
xset s off
xset -dpms

# Change cursor
xsetroot -cursor_name left_ptr

# Start the desktop
exec bspwm
