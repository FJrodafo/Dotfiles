#!/bin/bash

#  ╔═╗┬┬─┐┌─┐┬  ┌─┐┌┐┌┌─┐
#  ╠═╣│├┬┘├─┘│  ├─┤│││├┤ 
#  ╩ ╩┴┴└─┴  ┴─┘┴ ┴┘└┘└─┘

cache_file="$HOME/.cache/$(whoami)/airplane_state"

mkdir -p "$(dirname "$cache_file")"
[[ -f "$cache_file" ]] || echo Off > "$cache_file"

get_airplane_state() {
    cat "$cache_file"
}

airplane_on() {
    nmcli networking off
	# systemctl is-active --quiet bluetooth.service && bluetoothctl power off
    echo On > "$cache_file"
}

airplane_off() {
    nmcli networking on
	# systemctl is-active --quiet bluetooth.service && bluetoothctl power on
    echo Off > "$cache_file"
}

airplane_toggle() {
    if [[ $(get_airplane_state) == "Off" ]]; then
        airplane_on
    else
        airplane_off
    fi
}

case "$1" in
    --toggle) airplane_toggle ;;
    --status) get_airplane_state ;;
    *) echo "Usage: $0 [--toggle|--status]" ;;
esac
