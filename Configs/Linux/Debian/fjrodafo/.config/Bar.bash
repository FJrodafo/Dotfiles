# This file launch EWW bar
launch_bar(){
    # Function for generating workspaces.yuck file with EWW widgets
    generate_eww_workspaces() {
        local eww_file="${HOME}/.config/bar/workspaces.yuck"
        local monitors=$(bspc query -M --names)
        local count=0
        local listen_workspaces=""
        local widgets=""
        echo -e "; ╦ ╦┌─┐┬─┐┬┌─┌─┐┌─┐┌─┐┌─┐┌─┐┌─┐\n; ║║║│ │├┬┘├┴┐└─┐├─┘├─┤│  ├┤ └─┐\n; ╚╩╝└─┘┴└─┴ ┴└─┘┴  ┴ ┴└─┘└─┘└─┘\n" > "$eww_file"
        for m in $monitors; do
            local workspace_name="workspace${count}"
            listen_workspaces+="(deflisten ${workspace_name} \"scripts/WorkSpaces $m\")"
            widgets+="    (box :visible { monitor==\""$m\"" } (${workspace_name}))\n"
            local workspace_widgets="(defwidget ${workspace_name} [] (literal :content ${workspace_name}))"
            count=$((count + 1))
        done
        echo -e $listen_workspaces >> "$eww_file"
        echo -e $workspace_widgets >> "$eww_file"
        echo -e "(defwidget workspaces [monitor]\n  (box :orientation \"v\" :space-evenly \"false\" :valign \"start\"\n$widgets  )\n)" >> "$eww_file"
    }
    generate_eww_workspaces
    # Get a list of monitors and sort them so that the primary monitor is first
    local monitors=$(xrandr -q | grep -w 'connected' | sort -k3n | cut -d' ' -f1)
    local count=0
    for m in $monitors; do
        eww -c "${HOME}"/.config/bar open bar --id "$m" --arg monitor="$m" --toggle --screen $count
        count=$((count + 1))
    done
}
launch_bar
