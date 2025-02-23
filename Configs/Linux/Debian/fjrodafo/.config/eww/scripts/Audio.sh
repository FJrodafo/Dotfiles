#!/bin/bash

#  ╔═╗┬ ┬┌┬┐┬┌─┐
#  ╠═╣│ │ ││││ │
#  ╩ ╩└─┘─┴┘┴└─┘

get_output_value () {
    output=$(amixer get Master | grep -oP '\d+(?=%)' | head -n 1)
    deafen=$(amixer get Master | grep -oP '\[off\]' | wc -l)
    [[ $deafen -gt 0 ]] && echo "0" || echo "$output"
}

get_input_value () {
    input=$(amixer get Capture | grep -oP '\d+(?=%)' | head -n 1)
    mute=$(amixer get Capture | grep -oP '\[off\]' | wc -l)
    [[ $mute -gt 0 ]] && echo "0" || echo "$input"
}

get_output_icon () {
    vol_value=$(get_output_value)
    echo "./icons/Media/$( [[ $vol_value == "0" ]] && echo "Deafened" || echo "Headphones" ).png"
}

get_input_icon () {
    mic_value=$(get_input_value)
    echo "./icons/Media/$( [[ $mic_value == "0" ]] && echo "Muted" || echo "Microphone" ).png"
}

case "$1" in
    --output-value) get_output_value ;;
    --input-value) get_input_value ;;
    --output-icon) get_output_icon ;;
    --input-icon) get_input_icon ;;
    --toggle-deafen) amixer set Master toggle ;;
    --toggle-mute) amixer set Capture toggle ;;
esac
