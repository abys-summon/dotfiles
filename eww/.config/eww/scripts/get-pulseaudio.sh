#!/bin/sh

mode="$1"

print_state() {
  if pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes"; then
    echo -n "mute"
  else
    pactl get-sink-volume @DEFAULT_SINK@ | awk -F/ '{print $2}' | tr -d '% ' | tr -d '\n'
  fi
}

print_icon() {
  local state="$1"

  if [[ "$state" == "mute" ]]; then
    echo "audio-volume-muted.svg"
  elif (( state <= 30 )); then
    echo "audio-volume-low.svg"
  elif (( state <= 60 )); then
    echo "audio-volume-medium.svg"
  else 
    echo "audio-volume-high.svg"
  fi
}

emit() {
  state="$(print_state)"

  if [[ "$mode" == "state" ]]; then
    echo "$state"
  else
    print_icon "$state"
  fi
}

emit

pactl subscribe | while read -r line; do
  case "$line" in
    *"sink"*)
    emit
    ;;
  esac
done

