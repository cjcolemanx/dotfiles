#!/usr/bin/env bash

# Dirty and quick builder for an sxhkd config.
# Dependencies:
#   - awk
# Read `README.md` for caveats and config format.

# Gotta go into sxhkd dir first (less verbosity,
#   not too scary for the purposes of this script...
#   you'll probably already be in the folder already)
return_dir=$(pwd)

cd "$HOME/.config/sxhkd" || exit

declare -a INCLUDED_MAPPINGS=(
	"bspwm"
	# "i3" # not used in my config
	"media"
	"launchers"
	"notifications"
	"other"
	"screenshots"
)

# TODO: build title for BSPWM keybinds
# make_file_title() {}

# Build a pretty header
make_section_header() {
	title="$1"

	# Style
	title_top_l=" ┏"
	title_bottom_l=" ┗"
	title_top_r="┓"
	title_bottom_r="┛"
	title_bottom_append_symbol="─"

	# Start building
	title_top="$title_top_l"
	title_bottom="$title_bottom_l"

	# Make prettier with borders
	for ((i = 0; i < ${#title} - 4; i++)); do
		title_top="$title_top$title_bottom_append_symbol"
		title_bottom="$title_bottom$title_bottom_append_symbol"
	done

	title_top="$title_top$title_top_r"
	title_bottom="$title_bottom$title_bottom_r"

	# Append to bottom (offfset is based off spacing in printf and num chars removed from title)
	for ((i = 0; i < 122 - ${#title}; i++)); do
		title_bottom="$title_bottom$title_bottom_append_symbol"
	done

	printf "%s\n%s\n%s\n" "$title_top" "$title" "$title_bottom$title_top_r" >>keymap.txt
}

# Parses sxhkdrc.* files for descriptions and bindings
add_mapfile_to_keymaps() {
	maps_file="$1"

	# Style
	panel_bottom_l=" ┗"
	panel_bottom_r="┛"
	panel_bottom_append_symbol="─"
	panel_bottom="$panel_bottom_l"

	# Format: "### ~| <TITLE> |~ ###"
	section_title=$(awk "{print}" "$maps_file" | awk '/^### ~/')

	# Format: "# " (disregards notes)
	command_descriptions=$(awk "{print}" "$maps_file" | awk '/^# /' | awk '!/(NOTE|WARN|FIXME)/' | awk -F"\n" "{print}")

	# WARN: unused
	# Format: Commands always start with a double space
	# commands=$(awk -F"\n" "{print}" "$maps_file" | awk '/^( +|\t+)/')

	# Format: keybinds don't start with "#" or spaces, but CAN theoretically start with anything else
	keybinds=$(awk "{print}" "$maps_file" | awk '/^[^# \t](.+|\.+)/')

	# Add section header
	make_section_header "${section_title:4}"

	IFS=$'\n' a=($command_descriptions)
	IFS=$'\n' b=($keybinds)

	# Add some space to top
	printf "\t│ %2s %-51s   %-60s│\n" "" "" "" >>keymap.txt

	# Combine descriptions with their bindings
	for i in "${!a[@]}"; do
		a_sub="${a[i]:2}"
		# printf "\t│ %2s:%-51s|= %-60s│\n" "$i" "${a[i]}" "${b[i]}" >>keymap.txt
		printf "\t│ %2s: %-50s|= %-60s│\n" "$i" "$a_sub" "${b[i]}" >>keymap.txt
	done

	# Add some space to bottom
	printf "\t│ %2s %-51s   %-60s│\n" "" "" "" >>keymap.txt

	# Build panel bottom
	for ((i = 0; i < 118; i++)); do
		panel_bottom="$panel_bottom$panel_bottom_append_symbol"
	done

	panel_bottom="$panel_bottom$panel_bottom_r"

	printf " %s\n\n" "$panel_bottom" >>keymap.txt
}

# Make files
[[ ! -f ./sxhkdrc ]] && echo "No sxhkdrc file to write to. Creating one." && touch ./sxhkdrc
[[ ! -f ./keymap.txt ]] && echo "No keymap.txt file to write to. Creating one." && touch ./keymap.txt

# Make backup of files
cp -f ./sxhkdrc ./sxhkdrc.prev
cp -f ./keymap.txt ./keymap.txt.prev

# Clean files
printf "" >./sxhkdrc
printf "" >./keymap.txt

# Iterate included configs
for i in "${INCLUDED_MAPPINGS[@]}"; do
	if [[ -f "./sxhkdrc.$i" ]]; then
		contents=$(cat "sxhkdrc.$i")
		printf "Adding '%s' keymap to './sxhkdrc'\n" "$i"

		# Add to sxhkdrc
		printf "%s\n\n" "$contents" >>./sxhkdrc

		# Document maps
		add_mapfile_to_keymaps "sxhkdrc.$i"
	else
		echo "ERROR! File not found: 'sxhkdrc.$i'."
		echo "Check the INCLUDED_MAPPINGS array in ~/.config/sxhkd/make-rc.sh"
	fi
done

killall -q sxhkd
sxhkd -c "$HOME/.config/sxhkd/sxhkdrc" &

cd "$return_dir"
