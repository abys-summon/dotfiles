#!/usr/bin/env python3
import json
import subprocess
import sys

def get_info():
    try:
        process = subprocess.Popen(
            ["playerctl", "metadata", "--format", "{{status}}|{{title}}|{{artist}}", "--follow"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )

        for line in process.stdout:
            parts = line.strip().split('|')
            if len(parts) < 3:
                continue

            status, title, artist = parts[0], parts[1], parts[2]
            
            output = {
                "text": f"{title} - {artist}" if title else "Sin medios",
                "alt": status.lower(),
                "class": status.lower(),
                "tooltip": f"{title}\n{artist}\nEstado: {status}"
            }
            print(json.dumps(output), flush=True)

    except Exception:
        # Si playerctl falla (por ejemplo, no hay reproductores abiertos)
        print(json.dumps({"text": "No Media", "class": "paused", "alt": "paused"}), flush=True)

if __name__ == "__main__":
    # Ejecución inicial
    get_info()
