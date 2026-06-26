#!/bin/sh

get_cpu_times() {
    cat /proc/stat | grep '^cpu ' | awk '{ print ($2+$3+$4+$5+$6+$7+$8), $5 }'
}

read total_1 idle_1 <<< $(get_cpu_times)

sleep 0.5

read total_2 idle_2 <<< $(get_cpu_times)

total_diff=$((total_2 - total_1))
idle_diff=$((idle_2 - idle_1))

cpu_usage=$(( (1000 * (total_diff - idle_diff) / total_diff + 5) / 10 ))

echo "$cpu_usage"

