#!/bin/sh

if pgrep -x waybar >/dev/null; then
  killall waybar
else
  waybar > /dev/null 2>&1 &
fi

