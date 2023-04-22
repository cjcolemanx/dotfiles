#!/usr/bin/env bash
#
# Wrapper for a bunch of xshkd stuff, mainly
MIN_RATING="1"
MAX_RATING="5"

amount=5
seek_amount=00:00:05
up_sign=""
down_sign=""
paused_sign=""
stopped_sign=""
playing_sign=""
shuffling_sign=""
repeat_sign=""
next_sign=" "
previous_sign=" "
seek_forward_sign=">>"
seek_backward_sign="<<"
# next_sign=" --> "
# previous_sign=" <-- "
rating_sign=" "

file=$(mpc current -f '%file%')
current_rating=$(mpc sticker "$file" get rating | cut -f2 -d "=")
ncmpcpp_is_running=$(pgrep ncmpcpp)

sign=""
new_rating=""
# skip_notif=0

case "$1" in
up)
	mpc volume +$amount
	sign=$up_sign
	;;
down)
	mpc volume -$amount
	sign=$down_sign
	;;
play)
	mpc play
	sign=$playing_sign
	;;
stop)
	mpc stop
	sign=$stopped_sign
	;;
toggle_play)
	mpc toggle

	is_playing=$(mpc status | grep -m 1 -i '\[playing\]' | cut -f2 -d "[" | cut -f1 -d "]")

	if $is_playing; then
		sign="$paused_sign (paused)"
	else
		sign="$playing_sign (resumed)"
	fi
	;;
seek_forward)
	mpc seekthrough +$seek_amount

	if [ "$ncmpcpp_is_running" == "" ]; then
		sign="$seek_forward_sign"
	fi
	;;
seek_backward)
	mpc seekthrough -$seek_amount

	if [ "$ncmpcpp_is_running" == "" ]; then
		sign="$seek_backward_sign"
	fi
	;;
next)
	mpc next

	if [ "$ncmpcpp_is_running" == "" ]; then
		sign="$next_sign"
	else
		skip_notif=1
	fi
	;;
prev)
	mpc prev

	if [ "$ncmpcpp_is_running" == "" ]; then
		sign="$previous_sign"
	else
		skip_notif=1
	fi
	;;
shuffle)
	mpc shuffle
	sign="$shuffling_sign"
	;;
repeat)
	mpc repeat

	is_repeating=$(mpc status | grep -m 1 -i repeat | cut -f3 -d ':' | cut -f2 -d ' ')

	if [ "$is_repeating" == "on" ]; then
		sign="$repeat_sign"
	else
		sign=" "
	fi
	;;
rate_up)
	new_rating=$(echo "$current_rating+1" | bc)

	if [ "$current_rating" == "" ]; then
		new_rating="$MIN_RATING"
	elif [[ new_rating -gt MAX_RATING ]]; then
		new_rating="$MAX_RATING"
	fi

	mpc sticker "$file" set rating "$new_rating"

	sign="$rating_sign"
	;;
rate_down)
	new_rating=$(echo "$current_rating-1" | bc)

	if [ "$current_rating" == "" ]; then
		new_rating="$MIN_RATING"
	elif [[ new_rating -lt MIN_RATING ]]; then
		new_rating="$MIN_RATING"
	fi

	mpc sticker "$file" set rating "$new_rating"
	sign="$rating_sign"
	;;
rate)
	mpc sticker "$file" set rating "$2"
	;;
next_album)
	# playlist="$(mpc -f '[%albumartist%|%artist%] - %album%' playlist)"
	playlist="$(mpc -f '%album%' playlist)"
	readarray -t split_playlist <<<"$playlist"

	i="$(mpc -f %position% current)"

	# current="$(mpc -f '[%albumartist|%artsit%] - %album%' current)"
	current="$(mpc -f '%album%' current)"

	# boundary
	max=$((${#split_playlist[@]}))
	finished=False

	while [[ $i -lt $max && $finished = False ]]; do
		album="${split_playlist[i]}"

		if [[ "$current" = "$album" ]]; then
			((i++))
		else
			finished=True
		fi
	done

	# Adjust
	((i++))

	mpc play "$i"
	sign="$next_sign"
	;;
prev_album)
	# playlist="$(mpc -f '[%albumartist%|%artist%] - %album%' playlist)"
	playlist="$(mpc -f '%album%' playlist)"
	readarray -t split_playlist <<<"$playlist"

	i="$(mpc -f %position% current)"
	((i--))

	prev="${split_playlist[i]}"
	finished=False

	while [[ $finished = False ]]; do
		album="${split_playlist[i]}"

		if [[ "$prev" != "$album" ]]; then
			finished=True
		fi
		((i--))
	done

	prev="$album"
	finished=False

	while [[ $i -gt 0 && $finished = False ]]; do
		album="${split_playlist[i]}"

		if [[ "$prev" != "$album" ]]; then
			finished=True
			((i++))
		else
			((i--))
		fi
	done

	((i++))

	mpc play "$i"
	sign="$previous_sign"
	;;
*)
	sign=" "
	;;
esac

$HOME/bin/notifications/notify-mpd-song-info.sh "$sign"
