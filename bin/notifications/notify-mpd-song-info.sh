#!/usr/bin/env bash
USE_FORMAT=2
FORMAT_MAX_WIDTH=17

[[ $("$HOME/bin/notifications/check-disabled-notifications.sh") -eq 1 ]] && return

notification_title="Now Playing"

song_info="$(mpc --format '%artist%;%album%;%track%;%title%;%time%;%genre%' current)"

song="$(mpc --format '%artist%\n%album%\n%track% - %title% (%time%)\n %genre%' current)"

song_next="$(mpc --format '> %title% - %artist%' queued)"
song_volume=$(mpc volume | cut -f2 -d ":" | sed 's/\s//')
song_progress=$(mpc status | grep -m 1 -i "\[" | cut -f2 -d "(" | cut -f1 -d "%")
repeating=$(mpc status | grep -m 1 -i repeat | cut -f3 -d ":" | cut -f2 -d " ")

# Other stuff
file="$(mpc current -f '%file%')"
rating=$(mpc sticker "$file" get rating | cut -f2 -d "=")

rating_stars=""
line_break="====================="

if [ "$rating" == "" ]; then
	rating_stars="\- \- \- \- \-"
else
	rating_string=" "
	start=0

	while [ "$start" -lt "$rating" ]; do
		rating_stars="$rating_stars$rating_string"
		start=$((start + 1))
	done
fi

if [ -n "$rating" ]; then
	rating_stars="($rating) $rating_stars"
fi

# Image
preview_dir="$HOME/.tmp/ncmpcpp/previews"
preview_name="$preview_dir/$(mpc --format %album% current | base64).png"

[ -e "$preview_name" ] || ffmpeg -y -i "$MUSIC/$file" -an -vf scale=128:128 "$preview_name" >/dev/null 2>&1

# Fix no-image
! [ -f "$preview_name" ] && preview_name="$HOME/.tmp/ncmpcpp/default_cover.png"

# TODO: script to grab album art if not present

# Other stuff
passed_info="$1"
append_info=""

if [ "$repeating" == "on" ]; then
	append_info=" "
fi

artist=$(echo "$song_info" | cut -f 1 -d ";")
album_name=$(echo "$song_info" | cut -f 2 -d ";")
track_number=$(echo "$song_info" | cut -f 3 -d ";")
track_name=$(echo "$song_info" | cut -f 4 -d ";")
time=$(echo "$song_info" | cut -f 5 -d ";")
genre=$(echo "$song_info" | cut -f 6 -d ";")

track_name_truncated=""
album_name_truncated=""

track_name_length="${#track_name}"
album_name_length="${#album_name}"

if [[ track_name_length -gt FORMAT_MAX_WIDTH ]]; then
	offset=$((track_name_length - FORMAT_MAX_WIDTH))
	track_name_truncated="${track_name:0:offset} ..."
else
	track_name_truncated="$track_name"
fi

if [[ album_name_length -gt FORMAT_MAX_WIDTH ]]; then
	offset=$((album_name_length - FORMAT_MAX_WIDTH))
	album_name_truncated="${album_name:0:offset}..."
else
	album_name_truncated="$album_name"
fi

format_01="
Artist: $artist
Album:  $album_name 
Track:  $track_number - $track_name
             ($time)

Genre:  [$genre]
Rating: [$rating_stars]
"

format_02="  $artist
[$album_name_truncated]
$track_name_truncated 
                ($time)
 $genre
$rating_stars
"

format_03=""

format=""

case $USE_FORMAT in
1) format="$format_01" ;;
2) format="$format_02" ;;
3) format="$format_03" ;;
*) format="$format_01" ;; # default
esac

# dunstify "Now Playing" "$format" -i "$preview_name" -h string:x-dunst-stack-tag:debug-mpd

# Send it
dunstify "$notification_title $passed_info $song_volume" "\n$line_break\n$song $append_info\n\n\t$rating_stars\n$line_break\n$song_next" -h string:x-dunst-stack-tag:music-change -h "int:value:$song_progress" -a "MPC" -i "$preview_name" -t 3000
# dunstify "$notification_title $song_volume" "\t$rating_stars\n$line_break\n$song $append_info\n\n$song_next" -h string:x-dunst-stack-tag:music-change -h "int:value:$song_progress" -a "MPC" -i "$preview_name" -t 3000
