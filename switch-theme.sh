#!/usr/bin/sh

if [ $# -eq 0 ]
  then
      echo "Please specify new theme name"
      exit 1
fi

TMP="/tmp/switch-themes"

POLYBAR_CONFIG="$HOME/.config/polybar/config.ini"
ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.yml"
ROFI_CONFIG="$HOME/.config/rofi/config.rasi"
DUNST_CONFIG="$HOME/.config/dunst/dunstrc"

POLYBAR_THEME_PATH="$HOME/.config/polybar/themes/$1.ini"
ALACRITTY_THEME_PATH="$HOME/.config/alacritty/themes/$1.yml"
ROFI_THEME_PATH="$HOME/.config/rofi/themes/$1.rasi"
DUNST_THEME_PATH="$HOME/.config/dunst/dunstrc-$1"

if test -f "$POLYBAR_THEME_PATH"; then
    awk "/include-file\s*=\s*/{sub(/.*/, \"include-file = $POLYBAR_THEME_PATH\"); print; next} 1" "$POLYBAR_CONFIG" > "$TMP" \
        && cat "$TMP" > "$POLYBAR_CONFIG"
else
    echo -e "\033[33mWARNING\033[0m: No Such theme for polybar!"
fi

if test -f "$ALACRITTY_THEME_PATH"; then
    awk "/import:/{print; getline; sub(/- .*/, \"- $ALACRITTY_THEME_PATH\"); print; next} 1" "$ALACRITTY_CONFIG" > "$TMP" \
         && cat "$TMP" > "$ALACRITTY_CONFIG"
else
    echo -e "\033[33mWARNING\033[0m: No Such theme for alacritty!"
fi

if test -f "$ROFI_THEME_PATH"; then
    awk "/@theme /{sub(/\".*\"/, \"\\\"$ROFI_THEME_PATH\\\"\"); print; next} 1" "$ROFI_CONFIG" > "$TMP" \
        && cat "$TMP" > "$ROFI_CONFIG"
else
    echo -e "\033[33mWARNING\033[0m: No such theme for rofi!"
fi

if test -f "$DUNST_THEME_PATH"; then
    cp "$DUNST_THEME_PATH" "$DUNST_CONFIG"
else
    echo -e "\033[33mWARNING\033[0m: No such theme for dunst!"
fi

if test -f "$TMP"; then
    rm "$TMP"
fi
