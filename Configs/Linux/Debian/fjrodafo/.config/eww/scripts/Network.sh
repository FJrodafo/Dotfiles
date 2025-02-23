#!/bin/bash

#  ╔╗╔┌─┐┌┬┐┬ ┬┌─┐┬─┐┬┌─
#  ║║║├┤  │ ││││ │├┬┘├┴┐
#  ╝╚╝└─┘ ┴ └┴┘└─┘┴└─┴ ┴

airplane=$(./scripts/Airplane.sh --status)

icon="./icons/Network/Off.png"
status="Offline"

is_online() {
    ping -c 1 -W 1 debian.org &>/dev/null
}

id=$(ip link | awk '/state UP/ {print $2}' | tr -d :)

if [ "$airplane" = "On" ]; then
    icon="./icons/Network/Airplane.png"
    status="Airplane"
elif is_online; then
    icon="./icons/Network/On.png"
    
    if [[ $id == e* ]]; then
        status="$id"
    elif command -v nmcli &>/dev/null; then
        status=$(nmcli -t -f active,ssid dev wifi show | sed -n '1{s/SSID: //p}')
    fi
fi

case "$1" in
    --icon) echo "$icon" ;;
    --status) echo "$status" ;;
esac
