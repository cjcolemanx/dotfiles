#!/usr/bin/env bash
#
# Requires `xrandr`

# For ease, I just hard code these.
# In the future I may parse `xrandr --listactivemonitors` output
# FIXME: GAMMA NOT WORKING
MY_DISPLAYS=(
	HDMI-A-0
	HDMI-A-1
)
DEFAULT_BRIGHTNESS=1.0
DEFAULT_GAMMA=1.0
MAX_GAMMA=1.0

current_brightness=$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ')
current_gamma=$(xrandr --verbose | grep -m 1 -i gamma | cut -f2 -d ':' | sed 's/\s//g')

# Debugging
dunstify "GAMMA ($1)" "$current_gamma" -h string:x-dunst-stack-tag:debug-screen-info
# dunstify "BRIGHTNESS" "$current_brightness"

change_brightness="" # x.x
change_gamma=""      # r.r:g.g:b.b

case "$1" in
increase)
	change_brightness=$(echo "$current_brightness+0.1" | bc)
	change_gamma=$(echo "$current_gamma+.1" | bc)
	;;
decrease)
	change_brightness=$(echo "$current_brightness-0.1" | bc)
	change_gamma=$(echo "$current_gamma-.1" | bc)
	;;
increase_brightness)
	change_brightness=$(echo "$current_brightness+0.1" | bc)
	change_gamma="$current_gamma"
	;;
decrease_brightness)
	change_brightness=$(echo "$current_brightness-0.1" | bc)
	change_gamma="$current_gamma"
	;;
increase_gamma)
	change_brightness="$current_brightness"
	change_gamma=$(echo "$current_gamma+.1" | bc)
	;;
decrease_gamma)
	change_brightness="$current_brightness"
	change_gamma=$(echo "$current_gamma-.1" | bc)
	;;
*) # Default to reset
	change_brightness="$DEFAULT_BRIGHTNESS"
	change_gamma="$DEFAULT_GAMMA"
	;;
esac

# Fix max overflow or append 0 to decimals
if (($(echo "$change_gamma > $MAX_GAMMA" | bc -l))); then
	change_gamma=1.0
elif (($(echo "$change_gamma < $MAX_GAMMA" | bc -l))); then
	change_gamma="0$change_gamma"
fi

# dunstify "GAMMA INFO $1" "Gamma before formatting  =  $change_gamma" -h string:x-dunst-stack-tag:debug-screen-info

# Get correct format
change_gamma="$change_gamma:$change_gamma:$change_gamma"

for i in "${MY_DISPLAYS[@]}"; do
	xrandr --output "$i" --brightness "$change_brightness" --gamma "$change_gamma"
done

dunstify "SCREEN INFO" "Gamma      : $change_gamma\nBrightness : $change_brightness" -h string:x-dunst-stack-tag:screen-info
