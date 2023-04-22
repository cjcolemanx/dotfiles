#!/usr/bin/env bash
#
# Notifies user of volume change
#
# can take either "level", "mute", or "status" as first param
# takes the current volume level as second param
# takes the current mute state (on or off) as third param

change_type="$1"
volume_level="$2"
mute_state="$3"

symbol_up="[+]"
symbol_down="[-]"
symbol_mute="[M]"
symbol_unmute="[ ]"
symbol_status="   "
symbol_vol_low=" "
symbol_vol_mid=" "
symbol_vol_high=" "

muted_alert="(MUTED)"

icon=""
body=""
direction_symbol=""

# Alert relative volume level (for potential unmuting into LOUD volume)
if [ "$volume_level" -gt 40 ]; then
	icon="$symbol_vol_high"
elif [ "$volume_level" -gt 20 ]; then
	icon="$symbol_vol_mid"
else
	icon="$symbol_vol_low"
fi

# Change direction
if [ "$4" == "up" ]; then
	direction_symbol="$symbol_up"
else
	direction_symbol="$symbol_down"
fi

case "$change_type" in
level)
	body="$direction_symbol $icon : $((volume_level))%"
	;;
mute)
	if [ "$mute_state" == "off" ]; then
		body="$symbol_mute $icon : $((volume_level))%"
	else
		body="$symbol_unmute $icon : $((volume_level))%"
	fi
	;;
status)
	body="$symbol_status $icon : $((volume_level))%"
	;;
esac

# Alert user of muted status when changing volume
if [ "$mute_state" == "off" ]; then
	body="$body $muted_alert"
fi

# Send it
dunstify "$body" -h "int:value:$volume_level" -h string:x-dunst-stack-tag:volume-notif -a "VOLUME" -t 800
