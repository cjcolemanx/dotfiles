#!/usr/bin/env bash
#
# Too many symlinks! Quick-log a dir then go back
dir_travel_file="$HOME/.tmp/dir-travel.txt"

case "$1" in
set) pwd >"$dir_travel_file" ;;
where) cat "$dir_travel_file" ;;
travel) cd "$(head -1 "$dir_travel_file")" || echo "Directory travel FAILED: no folder :(" ;;
*) echo "Pass either 'set', 'where', or 'travel' as arguments when calling this script." ;;
esac

# if [[ "$1" == "set" ]]; then
# 	# Set travel path
# 	pwd >"$dir_travel_file"
# elif [[ "$1" == "where" ]]; then
# 	# Check location
# 	cat "$dir_travel_file"
# elif [[ "$1" == "travel" ]]; then
# 	# Go there
# 	cd "$(head -1 "$dir_travel_file")" || echo "Directory travel FAILED: no folder :("
# else
# 	echo "Pass either 'set', 'where', or 'travel' as arguments when calling this script."
# fi
