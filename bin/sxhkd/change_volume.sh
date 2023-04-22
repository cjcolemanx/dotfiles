#!/usr/bin/env bash
#
# SXHKD helper script
#
# Changes volume up or down and calls notification script
#
# Takes either up, down, mute, or status as arguments

change_type="" # Could use arg, but explicitly setting in case is nicer
direction=""   # changed by up/down ONLY

# Get Status
mute_status=$(amixer get Master | grep 'Front Left: Playback' | awk -F'[' '{print $3}' | awk -F']' '{print $1}')

# Unused (for now)
# vol_status=$(amixer get Master | grep 'Front Left: Playback' | awk -F'[' '{print $2}' | awk -F']' '{print $1}')

# Change volume
case "$1" in
up)
	amixer -Mq set Master,0 5%+
	change_type=level
	direction="$1"
	;;
down)
	amixer -Mq set Master,0 5%-
	change_type=level
	direction="$1"
	;;
up_head)
	amixer -Mq set Master,0 1%+
	change_type=level
	direction="$1"
	;;
down_head)
	amixer -Mq set Master,0 1%-
	change_type=level
	direction="$1"
	;;
mute)
	if [ "$mute_status" == "on" ]; then
		amixer sset Master mute
	else
		amixer sset Master unmute
	fi
	change_type=mute
	;;
status)
	change_type=status
	;;
esac

# Grab mixer info
speaker_level=$(amixer get Master | grep 'Front Left: Playback' | cut -d "[" -f 2 | cut -d "%" -f 1)

# Grab updated status
mute_status=$(amixer get Master | grep 'Front Left: Playback' | awk -F'[' '{print $3}' | awk -F']' '{print $1}')

# Show Notification
$HOME/bin/notifications/notify-volume-change.sh "$change_type" "$speaker_level" "$mute_status" "$direction"
