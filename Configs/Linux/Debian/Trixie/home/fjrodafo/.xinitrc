#!/bin/sh

# Prevent blank screen
xset s off
xset -dpms

# Start the desktop
exec bspwm
