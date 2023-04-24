#!/usr/bin/env bash
# Make formatted query
PLAYLIST=$(mpc -f '%position%. [%artist%|%albumartist%] - %title%' playlist)

# DEV ONLY
DEBUG="$1"
case $DEBUG in
--debug) dunstify "Rofi Debug" "$PLAYLIST" -h string:x-dunst-stack-tag:DEBUG-ROFI-DMENU-MPC-PLAYLIST ;;
esac

# MPC Command
run_cmd() {
	mpc play "$1"
	. "$HOME/bin/notifications/notify-mpd-song-info.sh"
}

# Rofi Command
run_rofi() {
	echo "$PLAYLIST" |
		rofi -dmenu -p "MPC Playlist"
}

# Launch Rofi
track_selected="$(run_rofi)"
# Pull out just the track number
track_selected="$(echo "$track_selected" | cut -f 1 -d ".")"
# Send track number to mpc
run_cmd $((track_selected))

exit 0
