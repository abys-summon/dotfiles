#!/bin/sh

cliphist list | rofi -dmenu -p "󰭟 " -theme config.rasi | cliphist decode | wl-copy
