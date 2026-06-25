#!/bin/bash
# ~/.config/rofi/scripts/powermenu.sh

options=" Lock\n Logout\n Reboot\n Shutdown\n Suspend"

choice=$(echo -e "$options" | rofi -dmenu -theme ~/.config/rofi/powermenu.rasi)

case "$choice" in
    " Lock")
        pkill rofi & sleep 0.5s && hyprlock
        ;;
    " Logout")
        command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'
        ;;
    " Reboot")
        confirm=" Yes\n No"
        response=$(echo -e "$confirm" | rofi -dmenu -p "Confirm?" -theme-str 'window {width: 100px; height: 92px; lines: 2;}' -theme ~/.config/rofi/powermenu.rasi)
        [[ "$response" == " Yes" ]] && systemctl reboot
        ;;
    " Shutdown")
        confirm=" Yes\n No"
	response=$(echo -e "$confirm" | rofi -dmenu -p "Confirm?" -theme-str 'window {width: 100px; height: 92px; lines: 2;}' -theme ~/.config/rofi/powermenu.rasi)
        [[ "$response" == " Yes" ]] && systemctl poweroff
        ;;
    " Suspend")
        systemctl suspend
        ;;
esac
