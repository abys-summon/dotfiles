#!/bin/sh

FILE_PATH="$HOME/Pictures/screenshots/shot$(date +'%Y-%m-%d_%H-%M-%S').png"

GEOMETRY=$(slurp -d -F "moon stone" -w 3 2>/dev/null)

if [ -z "$GEOMETRY" ]; then
    exit 0
fi

if grim -g "$GEOMETRY" - | tee "$FILE_PATH" | wl-copy --type image/png; then
    paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga

    notify-send "Saved screenshot" "$FILE_PATH" -i "$FILE_PATH"
fi

