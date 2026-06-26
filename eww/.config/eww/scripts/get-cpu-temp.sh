#!/usr/bin/env bash

sensors | grep 'Tctl' | awk '{print $2}' | sed 's/+//;s/°C//'

