#!/usr/bin/env bash

# ID ncmpcpp
winclass="$(xdotool search --class 'mpdplayer')"

# If ncmpcpp doesn't exist...
if [ -z "$winclass" ]; then
	kitty --class mpdplayer --name 'ncmpcpp' ncmpcpp #--session ./miniplayer-session
else
	# If ncmpcpp doesn't exist, create it and hide terminal
	if [ ! -f /tmp/mpdplayer ]; then
		touch /tmp/mpdplayer && xdo hide "$winclass"
	# If ncmpcpp does exist, remove it and show terminal
	elif [ -f /tmp/mpdplayer ]; then
		rm /tmp/mpdplayer && xdo show "$winclass"
	fi
fi
