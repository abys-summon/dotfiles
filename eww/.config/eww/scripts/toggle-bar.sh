#!/usr/bin/env bash

eww active-windows | grep -q "eww-bar" && eww close-all || eww open-many eww-bar eww-widgets
