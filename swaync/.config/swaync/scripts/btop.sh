#!/bin/sh

swaync-client -cp
hyprctl dispatch 'hl.dsp.exec_cmd("kitty -e btop", { float = true, size = { 1280, 720 } })'

