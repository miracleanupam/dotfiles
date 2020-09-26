#! /bin/bash

# # # # # # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# NAME
#     ./wifi.sh -simple wrapper to connect to wifi with nmcli 
# 
# SYNOPSIS
#     ./wifi.sh
#
# DESCRIPTION
#      Asks for SSID, PASSWORD and VISIBILITY of wifi to connect to and tries to connect to it.
#      
#
# AUTHOR
#      Written by Anupam Dahal
#
# COPYRIGHT
#      All Rights Reserved by the Author
#
# # # # # # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# Function to quit the script on erroneous exit status of commands
# Take the exit status of previous command as an argument
# If the argument is not equal to 0, exits the script with same exit status
function quit_on_error {
    echo $1
    if [[ $1 -ne 0 ]]; then
        echo $2
        exit $1
    fi
}

read -p 'SSID: ' SSID
read -sp 'PASSWORD: ' PASSWORD
echo 
read -p 'HIDDEN (y/n): ' HIDDEN

echo
echo Trying to connect to $SSID...

if [[ $HIDDEN == "y" ]]; then
    nmcli device wifi connect "$SSID" password $PASSWORD hidden yes
    quit_on_error $? "Oops!! Could not connect."
    echo Successfully connected.
    exit 1
else:
    nmcli device wifi connect "$SSID" password $password
    quit_on_error $? "Opps!! Could not Connect."
    echo Successfully connected.
    exit 1
fi
