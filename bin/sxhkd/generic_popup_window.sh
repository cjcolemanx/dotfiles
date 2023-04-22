#!/usr/bin/env bash
script="$1"
window_name="$2"

# ID the keybind window
winclass="$(xdotool search --class 'generic_floating_window')"

# If terminal doesn't exist...
if [ -z "$winclass" ]; then
	kitty --class binddoc --name "$window_name" --hold -e "$script"
else
	# If scratchpad doesn't exist, create it and hide terminal
	if [ ! -f /tmp/generic_float_win ]; then
		touch /tmp/binddoc && xdo hide "$winclass"
	# If scratchpad does exist, remove it and show terminal
	elif [ -f /tmp/generic_float_win ]; then
		rm /tmp/binddoc && xdo show "$winclass"
	fi
fi
