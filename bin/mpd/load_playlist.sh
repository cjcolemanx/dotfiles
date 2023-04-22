#!/usr/bin/env bash

PS3="Select playlist number to view contents: "

while true; do
	playlists=$(mpc lsplaylists)
	options=($playlists)

	select item in "${options[@]}"; do
		selected="$item"

		printf "\n%s contents:\n\n" "$item"
		mpc playlist "$item"

		echo
		read -rp "Use selected playlist? [y to continue]: " use_playlist

		case "$use_playlist" in
		y)
			echo
			mpc load "$selected"
			break 2
			;;
		*) break ;;
		esac
	done
done
