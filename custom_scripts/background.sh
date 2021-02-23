#!/bin/bash

# Script to change the background every one hour
# Takes a random image from specified directory and sets it as background
# Supports multiple monitors
# Sets the same image as background in all monitors
# Needs nitrogen as dependency

# :TODO: If the configuration file in not present, create it

# Specify the directory of nitrogen config file
NITROGEN_CFG=/home/anupam/.config/nitrogen/bg-saved.cfg;

# Seed for generating random number
RANDOM=$(date +%s%N | cut -b10-19);

# Wallpaper directory
WLPAPERS=(`ls /home/anupam/wallpapers/`);

# Generate a random number between 0 and number of wallpapers present in 
# wallpaper directory
# The operator $(( )) does the arithmatic operation in bash
# % operator does modulo division
# ${#VAR[@]} gives the length of array VAR
IDX=$(($RANDOM % ${#WLPAPERS[@]} + 1));

while true
do
    # Generate a new random number so wallpaper is changed 
    NEW_IDX=$(($RANDOM % ${#WLPAPERS[@]} + 1));

    # If the new random number is same as the last one, generate it again
    while [ $NEW_IDX -eq $IDX ]; do
        NEW_IDX=$(($RANDOM % ${#WLPAPERS[@]} + 1));
    done
    # Set num with the new value for that it can be checked again in one hour
    IDX=$NEW_IDX;

    # Select the wallpaper
    NEW_WLPAPER=${WLPAPERS[$IDX]};

    # Change the nitrogen config file to reflect the wallpaper name we want to set
    sed  -i "s/^file.*/file=\/home\/anupam\/wallpapers\/"$NEW_WLPAPER"/g" $NITROGEN_CFG;

    # Restore the config
    nitrogen --restore;

    # Wait for one hour
    sleep 3600
done

