#! /bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch new bar
echo "---" | tee -a /tmp/polybar1.log
polybar adbar>>/tmp/polybar1.log 2>&1 & disown
