#! /bin/bash

while true
do
    BATTERY_PERC=$(cat /sys/class/power_supply/BAT0/capacity);

    if [[ $BATTERY_PERC -lt 25 ]]; then
        sudo -u anupam DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -u critical -t 60000 "Battery Low, Plug In Power Source";
    fi
    sleep 300
done
