#!/usr/bin/env bash
# scripts/get-weather.sh

RAW_JSON=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=-27.37&longitude=-55.89&current=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code&timezone=auto&forecast_days=5")

echo "$RAW_JSON" | jq -c '{
    now: {
        temp: .current.temperature_2m,
        code: .current.weather_code
    },
    forecast: [
        range(0; 5) as $i | {
            day: (.daily.time[$i] | strptime("%Y-%m-%d") | strftime("%a")),
            min: .daily.temperature_2m_min[$i],
            max: .daily.temperature_2m_max[$i],
            code: .daily.weather_code[$i]
        }
    ]
}'