#!/bin/sh

SOCAT_PATH="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

get_data() {
  hyprctl activewindow -j | jq -rc '
    if .class == null or .class == "" then
      {
        initialTitle: "CachyOS",
        initialClass: "cachyos",
        title: "CachyOS",
        class: "cachyos"
      }
    else
      {
        initialTitle: .initialTitle,
        initialClass: (.initialClass | ascii_downcase),
        title: .title,
        class: .class
      }
    end
  '
}

get_data

socat -U - UNIX-CONNECT:"$SOCAT_PATH" | while read -r line; do
  case "$line" in
  "activewindow>>"*)
    get_data
  esac
done

