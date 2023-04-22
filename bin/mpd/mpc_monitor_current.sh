#!/usr/bin/env bash
# Busted and stolen
title='%title%|%name%'
artist='%artist%|%albumartist%|%composer%'
album_date='["%album%" [(%date%) | (%originaldate%)]]|["%album%"]'
format="Title: [$title]
Album: [$album_date]
Artist: [$artist]
Genre: %genre%
Comment: %comment%"

get_current_metadata() {
	mpc current -f "$format" 2>/dev/null | grep -v '^[a-zA-Z]*:\s*$'
}

tput civis
cleanup() {
	tput cnorm
}

trap cleanup EXIT
while true; do
	clear
	metadata="$(get_current_metadata)"

	if [ -z "$metadata" ]; then
		mpc current -f '%file%'
	else
		echo "$metadata"
	fi

	echo
done
