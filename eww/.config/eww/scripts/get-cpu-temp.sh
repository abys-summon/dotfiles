#!/usr/bin/env bash

# Script: cpu_temp.sh

sensors | grep 'Tctl' | awk '{print $2}' | sed 's/+//;s/°C//'
