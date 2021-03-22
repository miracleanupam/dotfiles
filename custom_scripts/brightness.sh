#! /bin/bash

POSITIONAL=();

while [[ $# -gt 0 ]]
do

    key="$1"
    case $key in
        -i|--inc)
            INC="$2"
            shift
            shift
            ;;
        -d|--dec)
            DEC="$2"
            shift
            shift
            ;;
        *)
            POSITIONAL+=("$1")
            shift
            ;;
    esac
done

if [[ ${#POSITIONAL[@]} -ne 0 ]]; then
    exit 1
fi

if [[ -n $INC ]]; then
    sudo xbacklight -inc $(( INC ))
elif [[ -n $DEC ]]; then
    sudo xbacklight -dec $(( DEC ))
else
    exit 1
fi
