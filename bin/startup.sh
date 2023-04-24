#!/usr/bin/env bash
#
# NOTE: Not currently in use, but will be soon(-ish)

# Kill these if running (On Restart)
killall -q sxhkd
killall -q picom
killall -q dunst
killall -q nitrogen

# Start basic daemons
sxhkd -c "$HOME/.config/sxhkd/sxhkdrc" &                   # Keybinds
picom --config "$HOME/.config/picom/picom.conf" --shadow & # Compositor
polybar -c "$HOME/.config/polybar/config.ini" main &       # Polybar Screen 1
polybar -c "$HOME/.config/polybar/config.ini" main2 &      # Polybar Screen 2
# . "$HOME/.config/polybar/launch.sh" --grayblocks &         # Polybar
clipmenud & # Clipboard
dunst &     # Notification daemon

nitrogen --restore # Wallpaper

# Start some programs
unclutter --start-hidden --timeout 1 & # Autihide cursor after 1 sed

# Removed:
# keepassxc & # NOTE: USE CLI INSTEAD

# Screen
# ~~~~~~~~~~~~~~~~~~~~

# Set default brightness and gamma
xrandr --output HDMI-A-0 --brightness 0.9 --gamma 0.8
xrandr --output HDMI-A-1 --brightness 0.9 --gamma 0.8

# Audio
# ~~~~~~~~~~~~~~~~~~~~

# Start mpd server
[ ! -s ~/.config/mpd/pid ] && mpd &

# Audio at an acceptable level
amixer get Master,0 20% unmute
mpc volume 100
