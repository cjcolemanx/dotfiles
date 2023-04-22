#!/usr/bin/env bash
make_links() {
	ln -s "$HOME/.config/X/$1" "$HOME/$1"
}

declare -a X_FILES=(
	".Xresources"
)

for i in "${X_FILES[@]}"; do
	make_links "$i"
done
