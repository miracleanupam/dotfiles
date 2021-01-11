#! /bin/bash

CHECK_DELAY_IN_SECS=300

while true
    do
        BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status);

        if [[ $BATTERY_STATUS -eq "Discharging" ]]; then
            BATTERY_PERC=$(cat /sys/class/power_supply/BAT0/capacity);
            if [[ $BATTERY_PERC -gt 50 ]]; then
                CHECK_DELAY_IN_SECS=600;
            elif [[ $BATTERY_PERC -lt 35 ]]; then
                CHECK_DELAY_IN_SECS=300;
            elif [[ $BATTERY_PERC -lt 30 ]]; then
                CHECK_DELAY_IN_SECS=150;
            elif [[ $BATTERY_PERC -lt 26 ]]; then
                sudo -u anupam DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -u critical -t $CHECK_DELAY_IN_SECS "Battery Low, Plug In Power Source";
            fi
            sleep $CHECK_DELAY_IN_SECS;

        else
            sleep $CHECK_DELAY_IN_SECS;
            CHECK_DELAY_IN_SECS=600;
        fi
    done
