#!/usr/bin/env bash
killall -q polybar
# For wait until the process is down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# Launch example
polybar example 2>&1 | tee -a /tmp/polybar.log & disown
