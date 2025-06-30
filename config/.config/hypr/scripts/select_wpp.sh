#!/usr/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */

WPP_DIR="$HOME/.config/hypr/wpp"
WPP_BACKEND="$HOME/.config/hypr/scripts/bgaction"
ROFI_THEME="$HOME/.config/rofi/wallpaper.rasi"
ICON_SIZE=$(echo "scale=1; (1080 * 3) / 150" | bc)
ADJUST_ICON_SIZE=$(echo "$icon_size" | awk '{if ($1 < 15) $1 = 20; if ($1 > 25) $1 = 25; print $1}')
ROFI_OVERRIDE="element-icon{size:${ADJUST_ICON_SIZE}%;}"

mapfile -d '' PICS < <(find -L "${WPP_DIR}" -type f -print0)
RANDOM_PIC="${PICS[$((RANDOM % ${#PICS[@]}))]}"
RANDOM_PIC_ICON="$HOME/.config/hypr/asset/RANDOM_IMG.JPG"
RANDOM_PIC_NAME=" Random"

ROFI_CMD="rofi -i -show -dmenu -config $ROFI_THEME -theme-str $ROFI_OVERRIDE"

menu() {
	printf "%s\x00icon\x1f%s\n" "$RANDOM_PIC_NAME" "$RANDOM_PIC_ICON"

	for PIC in "${PICS[@]}"; do
		PIC_NAME=$(basename "$PIC")
		PIC_CACHE="$HOME/.cache/wpp/$PIC_NAME.JPG"

		if [[ ! -f "$PIC_CACHE" ]]; then
			if [[ "$PIC_NAME" =~ \.(gif|GIF)$ ]]; then
				ffmpeg -i $PIC -vframes 1 $PIC_CACHE
			elif [[ "$PIC_NAME" =~ \.(mp4|MP$) ]]; then
				ffmpeg -i $PIC -vf "select=eq(n\,0)" -q:v 1 $PIC_CACHE
			else
				ffmpeg -i $PIC $PIC_CACHE
			fi
		fi

		printf "%s\x00icon\x1f%s\n" "$PIC_NAME" "$PIC_CACHE"
	done
}

CHOICE=$(menu | $ROFI_CMD)

if [[ -z "$CHOICE" ]]; then
	exit 0
fi

if [[ "$CHOICE" == "$RANDOM_PIC_NAME" ]]; then
	CHOICE="$RANDOM_PIC"
else
	CHOICE=$(find "$WPP_DIR" -name "$CHOICE")
fi

WPP_CMD="$WPP_BACKEND $CHOICE"
$WPP_CMD
