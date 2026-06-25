#!/bin/sh

# Función para enviar el estado "Vacío"
send_empty() {
    echo '{"text": "No Media", "alt": "off", "class": "off"}'
}

while true; do
    # 1. Verificamos si hay algún reproductor antes de empezar
    if ! playerctl status >/dev/null 2>&1; then
        send_empty
        # Esperamos un poco antes de reintentar para no saturar la CPU
        sleep 2
        continue
    fi

    # 2. Usamos --follow para cambios instantáneos
    # El '|| send_empty' se ejecuta si playerctl crashea o se cierra
    playerctl metadata --format '{"text": "{{title}} - {{artist}}", "alt": "{{lc(status)}}", "class": "{{lc(status)}}"}' --follow 2>/dev/null | while read -r line; do
        
        # Si la línea está vacía o el reproductor se detuvo, limpiamos
        if [ -z "$line" ]; then
            send_empty
        else
            echo "$line"
        fi
    done

    # 3. Si salimos del bucle 'read' es porque el reproductor se cerró
    send_empty
    sleep 1
done
