#!/bin/sh

currentVol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F '/' '{print $2}' | sed 's/%//')

case "$1" in
  up)
  if (( currentVol < 150 )); then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
  fi
  ;;
  down)
  pactl set-sink-volume @DEFAULT_SINK@ -5%
  ;;
esac

