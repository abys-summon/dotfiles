#!/bin/sh

send_empty() {
    echo '{"text": "No Media", "alt": "off", "class": "off"}'
}

while true; do
    if ! playerctl status >/dev/null 2>&1; then
        send_empty
        sleep 2
        continue
    fi

    playerctl metadata --format '{"text": "{{title}} - {{artist}}", "alt": "{{lc(status)}}", "class": "{{lc(status)}}"}' --follow 2>/dev/null | while read -r line; do

        if [ -z "$line" ]; then
            send_empty
        else
            echo "$line"
        fi
    done

    send_empty
    sleep 1
done

