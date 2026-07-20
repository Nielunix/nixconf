#! /usr/bin/env bash 

COLOR=$(hyprpicker)
wl-copy $COLOR
notify-send "Hyprpicker" "color: $COLOR" -i /home/lunix/nixconf/scripts/picker.svg

