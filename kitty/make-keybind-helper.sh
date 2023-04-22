#!/usr/bin/env bash

# Dirty and quick builder for a kitty config.
# Dependencies:
#   - awk

KITTY_FILE="keyboard.conf"
title_top_l="┏"
title_bottom_l="┗"
title_top_r="┓"
title_bottom_r="┛"
title_append_symbol="─"
title_name="~| Kitty Terminal |~"

# Make file
[[ ! -f ./keymap.txt ]] && echo "No keymap.txt file to write to. Creating one." && touch ./keymap.txt

# Make backup of file
cp -f ./keymap.txt ./keymap.txt.prev

# Clean file
printf "" >./keymap.txt

# Make Title
title_append=""

# Title border
for ((i = 0; i < "${#title_name}" - 4; i++)); do
	title_append="$title_append$title_append_symbol"
done

title_top=" $title_top_l$title_append$title_top_r "
title_bottom=" $title_bottom_l$title_append$title_bottom_r "

# Panel border
panel_size=115

for ((i = 0; i < panel_size - 11; i++)); do
	title_bottom="$title_bottom$title_append_symbol"
done

title_bottom="$title_bottom$title_top_r"

printf "%s\n%s\n%s\n" "$title_top" "$title_name" "$title_bottom" >>./keymap.txt

# Empty panel line
space_row="│"

for ((i = 0; i < panel_size; i++)); do
	space_row="$space_row "
done

space_row="$space_row│"

printf "\t%s\n" "$space_row" >>./keymap.txt

# Grab info
kitty_mod=$(awk "{print}" "$KITTY_FILE" | awk "/^kitty_mod/")
binds=$(awk "{print}" "$KITTY_FILE" | awk "/^map/")

# Add kitty_mod note
printf "\t│ %114s%s│\n" "[ Kitty Mod: $kitty_mod ]" "" >>./keymap.txt
printf "\t%s\n" "$space_row" >>./keymap.txt
printf "\t%s\n" "$space_row" >>./keymap.txt

IFS=$'\n' a=($binds)

# Build binds view
for i in "${a[@]}"; do
	# Get 'map' out of the way
	map_removed="${i:3}"

	# Get just the bind
	bind=$(echo "$map_removed" | awk "{split(\$0, a, \" \"); print a[1]}")
	action=$(echo "$map_removed" | awk "{split(\$0, a, \" \"); for (i in a) print a[i]}")

	# Parse actions
	IFS=$'\n' b=($action)

	action_string=""

	for j in "${b[@]}"; do
		action_string="$action_string $j"
	done

	printf "\t│ %-51s|= %-60s│\n" "$bind" "$action_string" >>./keymap.txt
done

# Add Space
printf "\t%s\n" "$space_row" >>./keymap.txt

# Build panel bottom
for ((i = 0; i < panel_size; i++)); do
	panel_bottom="$panel_bottom$title_append_symbol"
done

printf "\t%s\n" "$title_bottom_l$panel_bottom$title_bottom_r" >>./keymap.txt

cat ./keymap.txt
