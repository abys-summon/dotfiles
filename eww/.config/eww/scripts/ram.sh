#!/bin/sh

RAM=$(free | awk '/Mem:/ { printf "%d\n", (($3/$2) * 100) + 0.5 }')
echo "$RAM"

