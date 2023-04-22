#!/usr/bin/env bash
enable_user_service() {
	systemctl --user enable "$1"
}

declare -a user_services=(
	"kanata"
	# "wallpaper"
	# "mpris-proxy"
)

for i in "${user_services[@]}"; do
	enable_user_service "$i"
done
