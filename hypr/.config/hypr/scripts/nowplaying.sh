#!/bin/sh

if ! playerctl status > /dev/null 2>&1; then
    echo "󰝛   no media"
    exit 0
fi

song_info=$(playerctl metadata --format '{{title}}  󰐊  {{artist}}')
echo "$song_info"

