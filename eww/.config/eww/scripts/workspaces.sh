#!/usr/bin/env bash

get_active() {
  hyprctl activeworkspace -j | jq -r .id
}

active_id=$(get_active)

get_workspaces() {
  hyprctl workspaces -j | jq -rc --argjson active "$active_id" '
  map({id: .id, active: (.id == $active)}) | sort_by(.id)'
}

get_workspaces

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
  case "$line" in
    "workspace>>"*)
      active_id=$(get_active)
      get_workspaces
    ;;
  esac
done
