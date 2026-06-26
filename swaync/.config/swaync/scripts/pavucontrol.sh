#!/bin/sh

swaync-client -cp
hyprctl dispatch 'hl.dsp.exec_cmd("pavucontrol", { float = true })'

