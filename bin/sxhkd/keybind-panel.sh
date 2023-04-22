#! /usr/bin/sh

# ID the keybind window
winclass="$(xdotool search --class 'binddoc')"

# If terminal doesn't exist...
if [ -z "$winclass" ]; then
	kitty --class binddoc --name 'Keybindings' --hold bat "$HOME/bin/mybinds"
else
	# If scratchpad doesn't exist, create it and hide terminal
	if [ ! -f /tmp/binddoc ]; then
		touch /tmp/binddoc && xdo hide "$winclass"
	# If scratchpad does exist, remove it and show terminal
	elif [ -f /tmp/binddoc ]; then
		rm /tmp/binddoc && xdo show "$winclass"
	fi
fi
