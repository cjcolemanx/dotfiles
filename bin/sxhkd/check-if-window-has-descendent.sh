#!/usr/bin/env bash
query=$(bspc query -T -n)
dunstify "TEST" "$query"
echo "$query" >tmp.txt
