#!/bin/sh

# Disable the X11 screensaver mechanism entirely
xset s off

# Disable DPMS (display power management), so the monitor never gets put to standby/suspend/off
xset -dpms

# Instead of blanking to black, show a moving dot pattern (legacy CRT anti-burn-in feature; irrelevant on LCD/LED)
xset s noblank

# Set the default cursor
xsetroot -cursor_name left_ptr

# Set the keyboard layout
setxkbmap -layout us -option

# Start the desktop environment
exec bspwm
