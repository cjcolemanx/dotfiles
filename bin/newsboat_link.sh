#!/usr/bin/env bash

# Stolen from BugsWriter
# Requires:
# - readability-cli (https://www.npmjs.com/package/readability-cli)
# - sxiv
# - zathura
# - qndl (https://aur.archlinux.org/packages/qdl)

# Pass a video -> mpv
# Pass an image -> curl and sxiv it
# Pass a pdf or comic -> zathura
# Pass an audio file -> download it

if [ -z "$1" ]; then
	exit
else
	url="$1"
fi

case "$url" in
*mkv | *webm | *mp4 | *youtube.com/watch* | *youtube.com/playlist* | *youtube.com/shorts* | *youtu.be* | *hooktube.com* | *bitchute.com* | *odysee.com*)
	setsid -f mpv -quiet "$url" >/dev/null 2>&1
	;;
*png | *jpg | *jpe | *jfif | *gif | *jpeg)
	curl -sL "$url" >"/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" && sxiv -a "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" >/dev/null 2>&1
	;;
*pdf | *cbz | *cbr)
	curl -sL "$url" >"/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" && zathura "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" >/dev/null 2>&1
	;;
# *mp3|*flac|*opus|*mp3?source*)
#   qndl "$url" 'curl -LO' >/dev/null 2>&1 ;;
*)
	# readable -o /tmp/x.html -s $HOME/.config/newsboat/style.css
	# readable -o /tmp/x.html "$url" >/dev/null 2>&1 && setsid -f "$BROWSER" /tmp/x.html >/dev/null 2>&1
	readable -o /tmp/x.html "$url" >/dev/null 2>&1 && setsid -f qutebrowser /tmp/x.html >/dev/null 2>&1
	;;
esac
