#!/usr/bin/env bash

second=$(date +%-S)
minute=$(date +%-M)
hour=$(date +%-H)
time_zone=$(date +%EZ)
day=$(date +%-d)
month=$(date +%-m)
month_large=$(LANG=C date +%B)
year=$(date +%Y)

jq -n \
  --argjson second "$second" \
  --argjson minute "$minute" \
  --argjson hour "$hour" \
  --arg timeZone "$time_zone" \
  --argjson day "$day" \
  --argjson month "$month" \
  --arg monthLarge "$month_large" \
  --argjson year "$year" \
  '{second: $second, minute: $minute, hour: $hour, timeZone: $timeZone, day: $day, month: $month, monthLarge: $monthLarge, year: $year}'
