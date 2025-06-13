#!/bin/bash

#  ╔═╗┬  ╦╔═┌─┐┬ ┬┌─┐┬─┐|┌─┐  ╦ ╦┌─┐┌─┐┬┌─┬ ┬  ╦ ╦┬┌┬┐┌─┐┌─┐┌┬┐┌─┐
#  ║╣ │  ╠╩╗│ ││││├─┤├┬┘ └─┐  ║║║├─┤│  ├┴┐└┬┘  ║║║│ │││ ┬├┤  │ └─┐
#  ╚═╝┴─┘╩ ╩└─┘└┴┘┴ ┴┴└─ └─┘  ╚╩╝┴ ┴└─┘┴ ┴ ┴   ╚╩╝┴─┴┘└─┘└─┘ ┴ └─┘

# This file launch eww
launch_eww() {
    # Check if eww /calendar is active by using 'eww active-windows'
    local eww_active_windows=$(~/.eww/target/release/eww active-windows)

    # Close calendar if it's open
    [[ "$eww_active_windows" == *"calendar"* ]] && ~/.eww/target/release/eww close calendar

    # Get a list of monitors and sort them so that the primary monitor is first
    local monitors=$(xrandr -q | grep -w 'connected' | sort -k3n | cut -d' ' -f1)
    local count=0

    for m in $monitors; do
        ~/.eww/target/release/eww open bar --id "$m" --arg monitor="$m" --toggle --screen $count
        count=$((count + 1))
    done

    # Adjust left padding based on whether the bar is active or not
    bspc config left_padding $( [[ "$eww_active_windows" == *"bar"* ]] && echo 0 || echo 57 )
}

launch_eww
