#!/bin/bash

source "/Users/kevin/.config/scripts/palette.sh"


if [[ "$1" == "$FOCUSED_WORKSPACE" ]]; then
  color="#7aa2f7"
  bg="#3b4261"
  label="#7aa2f7"
else
  color=$grey
  bg=$bg4
  label=$grey
fi

sketchybar --set $NAME \
           background.color=$(hex_to_rgba $bg) \
           icon.color=$(hex_to_rgba $color) \
           label.color=$(hex_to_rgba $label)

icon_strip=""
apps=$(aerospace list-windows --workspace "$1" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')


if [ "${apps}" != "" ]; then
  while read -r app; do
    icon_strip+="$(/Users/kevin/.config/scripts/icon_map_fn.sh "$app") "
  done <<<"${apps}"

  sketchybar --set $NAME label="$icon_strip" drawing=on
else
  sketchybar --set $NAME drawing=off
fi
