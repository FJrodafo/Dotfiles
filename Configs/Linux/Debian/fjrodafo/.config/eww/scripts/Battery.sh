#!/bin/bash

#  ╔╗ ┌─┐┌┬┐┌┬┐┌─┐┬─┐┬ ┬
#  ╠╩╗├─┤ │  │ ├┤ ├┬┘└┬┘
#  ╚═╝┴ ┴ ┴  ┴ └─┘┴└─ ┴ 

battery="/sys/class/power_supply/BAT0"

status="$(cat "$battery/status")"
capacity="$(cat "$battery/capacity")"

icon() {
    [ "$status" = Charging ] && icon="./icons/Battery/Charging.svg" && echo "$icon" && exit

    if [ "$capacity" -gt "90" ]; then
        icon="./icons/Battery/100.svg"  # icon="󰁹"
    elif [ "$capacity" -gt "80" ]; then
        icon="./icons/Battery/90.svg"  # icon="󰂂"
    elif [ "$capacity" -gt "70" ]; then
        icon="./icons/Battery/80.svg"  # icon="󰂁"
    elif [ "$capacity" -gt "60" ]; then
        icon="./icons/Battery/70.svg"  # icon="󰂀"
    elif [ "$capacity" -gt "50" ]; then
        icon="./icons/Battery/60.svg"  # icon="󰁿"
    elif [ "$capacity" -gt "40" ]; then
        icon="./icons/Battery/50.svg"  # icon="󰁾"
    elif [ "$capacity" -gt "30" ]; then
        icon="./icons/Battery/40.svg"  # icon="󰁽"
    elif [ "$capacity" -gt "20" ]; then
        icon="./icons/Battery/30.svg"  # icon="󰁼"
    elif [ "$capacity" -gt "10" ]; then
        icon="./icons/Battery/20.svg"  # icon="󰁻"
    elif [ "$capacity" -gt "0" ]; then
        icon="./icons/Battery/10.svg"  # icon="󰁺"
    else
        icon="./icons/Battery/0.svg"  # icon="󰂎"
    fi

    echo "$icon"
}

tooltip() {
    [ -d "$battery" ] || { echo "No battery"; exit; }

    echo "$capacity%"
}

[ "$1" = "icon" ] && icon && exit
[ "$1" = "tooltip" ] && tooltip && exit

exit
