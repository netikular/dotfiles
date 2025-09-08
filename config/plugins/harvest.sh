#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

TIMER="$(~/.local/bin/harvest_cli -s -b)"

read VALUE NOTE <<< "$TIMER"

sketchybar --set timer label="$VALUE" icon.padding_right=0 icon.padding_left=0 background.padding_right=0 background.padding_left=0 padding_right=0 padding_left=0
sketchybar --set note label="$NOTE" icon.padding_right=0 icon.padding_left=0 background.padding_right=0 background.padding_left=0 padding_right=0 padding_left=0

if [[ "$NOTE" == "paused" ]]; then
    sketchybar --set timer label.color=0xffed8796 
else
    sketchybar --set timer label.color=0xffa6da95
fi
    


