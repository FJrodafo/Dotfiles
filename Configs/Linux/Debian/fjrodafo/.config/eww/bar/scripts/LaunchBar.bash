# This file launch EWW bar

launch_bar(){
    # Check if EWW bar is active by using 'eww active-windows'
    local eww_active_windows=$(~/.eww/target/release/eww active-windows)

    if [[ "$eww_active_windows" == *"bar"* ]]; then
        bspc config left_padding 0
    else
        bspc config left_padding 54
    fi

    # Get a list of monitors and sort them so that the primary monitor is first
    local monitors=$(xrandr -q | grep -w 'connected' | sort -k3n | cut -d' ' -f1)
    local count=0

    for m in $monitors; do
        ~/.eww/target/release/eww open bar --id "$m" --arg monitor="$m" --toggle --screen $count
        count=$((count + 1))
    done
}

launch_bar
