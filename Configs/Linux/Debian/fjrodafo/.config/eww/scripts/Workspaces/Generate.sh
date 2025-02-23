#!/bin/bash

#  ╦ ╦┌─┐┬─┐┬┌─┌─┐┌─┐┌─┐┌─┐┌─┐┌─┐     ╔═╗┌─┐┌┐┌┌─┐┬─┐┌─┐┌┬┐┌─┐
#  ║║║│ │├┬┘├┴┐└─┐├─┘├─┤│  ├┤ └─┐  ─  ║ ╦├┤ │││├┤ ├┬┘├─┤ │ ├┤ 
#  ╚╩╝└─┘┴└─┴ ┴└─┘┴  ┴ ┴└─┘└─┘└─┘     ╚═╝└─┘┘└┘└─┘┴└─┴ ┴ ┴ └─┘

generate_eww_workspaces() {
    local eww_file="${HOME}/.config/eww/bar/workspaces.yuck"
    local monitors=$(bspc query -M --names)
    local count=0
    local listen_workspaces=""
    local widgets=""

    echo -e ";  ╦ ╦┌─┐┬─┐┬┌─┌─┐┌─┐┌─┐┌─┐┌─┐┌─┐\n;  ║║║│ │├┬┘├┴┐└─┐├─┘├─┤│  ├┤ └─┐\n;  ╚╩╝└─┘┴└─┴ ┴└─┘┴  ┴ ┴└─┘└─┘└─┘\n" > "$eww_file"

    for m in $monitors; do
        local workspace_name="bar-workspace-${count}"
        listen_workspaces+="(deflisten ${workspace_name} \"./scripts/Workspaces/Style.sh $m\")"
        widgets+="    (box :visible { monitor==\""$m\"" } (${workspace_name}))\n"
        local workspace_widgets="(defwidget ${workspace_name} [] (literal :content ${workspace_name}))"
        count=$((count + 1))
    done

    echo -e $listen_workspaces >> "$eww_file"
    echo -e $workspace_widgets >> "$eww_file"
    echo -e "(defwidget bar-workspaces-widget [monitor]\n  (box :valign \"start\" :orientation \"v\" :space-evenly false\n$widgets  )\n)" >> "$eww_file"
}

generate_eww_workspaces
