#!/bin/sh

gpu_used=$(cat /sys/class/drm/card1/device/gpu_busy_percent)
echo "$gpu_used"
