#!/usr/bin/env bash
#
# NOTE: Not currently in use, but will be soon(-ish)

# Kill these if running
killall -q sxhkd
killall -q picom
killall -q dunst
killall -q nitrogen

# Start basic daemons
sxhkd -c "$HOME/.config/sxhkd/sxhkdrc" &
picom --config "$HOME/.config/picom/picom.conf" --shadow &
. "$HOME/.config/polybar/launch.sh" --grayblocks &
clipmenud &
dunst &

nitrogen --restore

# Start some programs
keepassxc &

# Screen
xrandr --output HDMI-A-0 --brightness 0.9 --gamma 0.8
xrandr --output HDMI-A-1 --brightness 0.9 --gamma 0.8

# Audio at an acceptable level
amixer get Master,0 20% unmute
mpc volume 100
