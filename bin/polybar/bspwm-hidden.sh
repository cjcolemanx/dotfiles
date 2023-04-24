#!/usr/bin/env bash
num=$(bspc query -N -n .hidden | wc -l)

echo "$num"
