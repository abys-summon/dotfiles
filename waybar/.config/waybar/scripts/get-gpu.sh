#!/bin/sh

. $HOME/.config/zsh/export.zsh
gpu_used=$(cat $GPU_BUSY_PATH)
echo "$gpu_used"

