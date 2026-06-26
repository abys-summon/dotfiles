#!/bin/sh

DIR="$HOME/Pictures/screenshots/"

FILE_NAME="shot$(date +'%Y-%m-%d_%H-%M-%S').png"

if grim -g "$(slurp -d -F "moon stone" -w 3)" "$DIR$FILE_NAME"; then
    paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
    notify-send "Screenshot saved" "In $DIR"
fi

