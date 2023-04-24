#!/usr/bin/env bash

PROMPT_TITLE="$1"

if [[ $1 = 0 ]]; then
	PROMPT_TITLE="Type piped text"
fi

selection=$(rofi -i -dmenu -p "$PROMPT_TITLE")
echo "$selection"
