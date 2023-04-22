#!/usr/bin/env bash
# File to hold window id
BSPWM_HIDDEN_DB="/tmp/bspwm_hidden_windows"

# Add first hidden to history file
bspc query -N -n .hidden | tail -n1 >"$BSPWM_HIDDEN_DB"
