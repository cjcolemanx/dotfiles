#!/usr/bin/env bash
cp_dots() {
	echo "Copying $1 config"

	if [ -f "$HOME/.config/$1" ]; then
		cp -f "$HOME/.config/$1" ./
	elif [ -d "$HOME/.config/$1" ]; then
		# Keep gitignores up to date FIRST
		if [ -f "./$1/.gitignore" ]; then
			cp -f "$1/.gitignore" "$HOME/.config/$1/.gitignore"
		fi

		cp -rf "$HOME/.config/$1" ./
	fi
}

declare -a DOTFILES=(
	# ".oh-my-zsh"
	# "alacritty"
	"bash"
	"bat"
	"bin"
	"bspwm"
	# "cmus"
	"dunst"
	# "evremap"
	# "eww"
	# "feh"
	"flameshot"
	# "fish"
	# "git"
	# "i3"
	# "i3blocks"
	"kanata"
	"kitty"
	"kmonad"
	# "miniplayer"
	"mpd"
	"mpv"
	"ncmpcpp"
	"neofetch"
	"neomutt"
	"newsboat"
	# "nitrogen"
	# "nnn"
	"nvim"
	# "picom"
	"polybar"
	"ranger"
	"rofi"
	"shell"
	"sxhkd"
	# "spacemacs"
	"systemd"
	# "taskwarrior"
	# "tmux"
	"qutebrowser"
	# "wal"
	"wallpapers"
	"X"
	# ".xinitrc"
	"zathura"
	"zsh"
)

for i in "${DOTFILES[@]}"; do
	cp_dots "$i"
	wait
done
