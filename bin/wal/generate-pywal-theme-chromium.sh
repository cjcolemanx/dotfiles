#!/bin/bash

. ~/.cache/wal/colors.sh # import colors from pywal

THEME_NAME="Pywal"

DIR=$(dirname "${BASH_SOURCE[0]}")
THEME_DIR="$DIR/$THEME_NAME"

# Converts hex colors into rgb joined with comma
# #fff -> 255, 255, 255
hexToRgb() {
	# Remove '#' character from hex color #fff -> fff
	plain=${1#*#}
	printf "%d, %d, %d" 0x${plain:0:2} 0x${plain:2:2} 0x${plain:4:2}
}

prepare() {
	if [ -d $THEME_DIR ]; then
		rm -rf $THEME_DIR
	fi

	mkdir $THEME_DIR
	mkdir "$THEME_DIR/images"

	# Copy wallpaper so it can be used in theme
	background_image="images/theme_ntp_background_norepeat.png"
	cp "$wallpaper" "$THEME_DIR/$background_image"

}

background=$(hexToRgb $background)
foreground=$(hexToRgb $foreground)
accent=$(hexToRgb $color11)
secondary=$(hexToRgb $color8)
# background=$(hexToRgb $color8)
# foreground=$(hexToRgb $foreground)
# accent=$(hexToRgb $background)
# secondary=$(hexToRgb $color11)
# background=$(hexToRgb "$color11") # Secondary
# foreground=$(hexToRgb "$color7")  # Text
# accent=$(hexToRgb "$color2")      # Main
# secondary=$(hexToRgb "$color6")
text_dark=$(hexToRgb "$color0")
text_light=$(hexToRgb "$color7")

generate() {
	# Theme template
	cat >"$THEME_DIR/manifest.json" <<EOF
    {
      "manifest_version": 3,
      "version": "1.0",
      "name": "$THEME_NAME Theme",
      "theme": {
        "images": {
          "theme_ntp_background" : "$background_image"
        },
        "colors": {
          "frame": [$background],
          "frame_inactive": [$background],
          "toolbar": [$accent],
          "ntp_text": [$text_dark],
          "ntp_link": [$accent],
          "ntp_section": [$secondary],
          "button_background": [$foreground],
          "toolbar_button_icon": [$foreground],
          "toolbar_text": [$text_dark],
          "omnibox_background": [$background],
          "omnibox_text": [$foreground]
        },
        "properties": {
          "ntp_background_alignment": "bottom"
        }
      }
    }
EOF
}

prepare
generate
echo "Pywal Chrome theme generated at $THEME_DIR"
