#!/bin/bash

#  ╦ ╦┌─┐┬─┐┬┌─┌─┐┌─┐┌─┐┌─┐┌─┐┌─┐     ╔═╗┌┬┐┬ ┬┬  ┌─┐
#  ║║║│ │├┬┘├┴┐└─┐├─┘├─┤│  ├┤ └─┐  ─  ╚═╗ │ └┬┘│  ├┤ 
#  ╚╩╝└─┘┴└─┴ ┴└─┘┴  ┴ ┴└─┘└─┘└─┘     ╚═╝ ┴  ┴ ┴─┘└─┘

contains() {
    [[ $1 =~ (^|[[:space:]])$2($|[[:space:]]) ]] && echo 1 || echo 0
}

print_workspaces() {
    local buf=""
    local desktops=$(bspc query -D --monitor $1)
    local focused_desktop=$(bspc query -D -d .active --monitor $1)
    local occupied_desktops=$(bspc query -D -d .occupied --monitor $1)

    for d in $desktops; do
        if [[ "$focused_desktop" == "$d" ]]; then
            ws="$d"
            icon="󰮯"
            tooltip="Focused"
            class="bar-workspace-focused"
        elif [[ $(contains "$occupied_desktops" "$d") -eq 1 ]]; then
            ws="$d"
            icon="󰊠"
            tooltip="Occupied"
            class="bar-workspace-occupied"
        else
            ws="$d"
            icon=""
            tooltip="Empty"
            class="bar-workspace-empty"
        fi

        buf+="(eventbox :tooltip \"$tooltip\" :cursor \"pointer\" (button :class \"$class\" :onclick \"bspc desktop -f $ws\" :onrightclick \"bspc node -d $ws\" \"$icon\"))"
    done

    echo "(box :class \"bar-workspaces\" :valign \"center\" :halign \"center\" :vexpand true :hexpand true :orientation \"v\" $buf)"
}

print_workspaces $1

bspc subscribe desktop node_transfer | while read -r _ ; do
    print_workspaces $1
done
