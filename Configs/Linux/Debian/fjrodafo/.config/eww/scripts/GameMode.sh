#!/bin/bash

#  ╔═╗┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐
#  ║ ╦├─┤│││├┤   ║║║│ │ ││├┤ 
#  ╚═╝┴ ┴┴ ┴└─┘  ╩ ╩└─┘─┴┘└─┘

cache_file="$HOME/.cache/$(whoami)/gamemode_state"
cpu_governor_path="/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"

mkdir -p "$(dirname "$cache_file")"
[[ -f "$cache_file" ]] || echo Off > "$cache_file"

get_gamemode_state() {
    cat "$cache_file"
}

set_cpu_governor() {
    local governor=$1
    echo $governor | pkexec tee /sys/devices/system/cpu/*/cpufreq/scaling_governor
}

gamemode_on() {
    # dunstctl set-paused true
    pkill -f picom
    set_cpu_governor performance
    echo On >"$cache_file"
}

gamemode_off() {
    # dunstctl set-paused false
    picom --config "$HOME"/.config/picom/picom.conf &
    set_cpu_governor ondemand
    echo Off >"$cache_file"
}

gamemode_toggle() {
    if [[ $(get_gamemode_state) == "Off" ]]; then
        gamemode_on
    else
        gamemode_off
    fi
}

case "$1" in
    --toggle) gamemode_toggle ;;
    --status) get_gamemode_state ;;
    *) echo "Usage: $0 [--toggle|--status]" ;;
esac
