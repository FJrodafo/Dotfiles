#!/bin/bash

spinner=('\' '|' '/' '─')

spin() {
    echo -ne " "
    while true
    do
        for s in ${spinner[@]}
        do
            echo -ne "\b${s}"
            sleep 0.2
        done
    done
}

echo -ne "Loading: "
spin
