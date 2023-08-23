#! /bin/bash

if [[ "$#" -gt 0 ]]; then
  if [[ -n $1 ]]; then
    FILE=$(grep -in -r "$1" . | dmenu -i -l 25 -p 'Choose file: ' | awk '{ print $1 }')
  fi
else
  ACTION=$(echo "" | dmenu -p "Enter Search Term: ")
  if [[ -n $ACTION ]]; then
    FILE=$(grep -in -r $ACTION . | dmenu -i -l 25 -p 'Choose file: ' | awk '{ print $1 }')
  fi
fi
if [[ -n $FILE ]]; then
  BUFFER=$(echo "$FILE" | awk '{ print $1 }' FS=":")
  LINE=$(echo "$FILE" | awk '{ print $2 }' FS=":")
  vim "+$LINE" "$BUFFER"
fi

