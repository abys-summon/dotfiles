#!/bin/sh

swaync-client -cp
hyprctl dispatch 'hl.dsp.exec_cmd("nm-connection-editor", { float = true })'

