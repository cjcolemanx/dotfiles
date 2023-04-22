#!/usr/bin/env bash
#
# Adapted from https://github.com/GideonWolfe/Zathura-Pywal to fit my uses
#
# TODO: split rc files and cat them together (prevents having to do a bunch
# of manual deletion in the generated rc)

pywal_cache="$HOME/.cache/wal/colors.sh"
tmp_dir=$(mktemp -d)

# Set this to something else if needed
zathura_dir="$HOME/.config/zathura"

# Get existing config (don't overwrite)
[ -f "$zathura_dir/zathurarc" ] && cat "$zathura_dir/zathurarc" >>"$tmp_dir/zathurarc"

printf "\n\n# Generated Pywal colors (only touch things above this line)\n" >>"$tmp_dir/zathurarc"
printf "# Use Ctrl+r to change colors back to normal\n" >>"$tmp_dir/zathurarc"

do_colors() {
	. "$pywal_cache"

	cat <<CONF
set recolor "true"

set completion-bg "$background"
set completion-fg "$foreground"
set completion-group-bg "$background"
set completion-group-fg "$color2"
set completion-highlight-bg "$foreground"
set completion-highlight-fg "$background"

set recolor-lightcolor "$background"
set recolor-darkcolor "$foreground"
set default-bg "$background"

set inputbar-bg "$background"
set inputbar-fg "$foreground"
set notification-bg "$background"
set notification-fg "$foreground"
set notification-error-bg "$color1"
set notification-error-fg "$foreground"
set notification-warning-bg "$color1"
set notification-warning-fg "$foreground"
set statusbar-bg "$background"
set statusbar-fg "$foreground"
set index-bg "$background"
set index-fg "$foreground"
set index-active-bg "$foreground"
set index-active-fg "$background"
set render-loading-bg "$background"
set render-loading-fg "$foreground"

set window-title-home-tilde true
set statusbar-basename true
set selection-clipboard clipboard
CONF
}

do_colors >>"$tmp_dir/zathurarc"
cp -f "$tmp_dir/zathurarc" "$zathura_dir"

cat "$tmp_dir/zathurarc"
