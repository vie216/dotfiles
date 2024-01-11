#!/usr/bin/sh

picom -b
feh --no-fehbg --bg-fill wallpapers/galaxy-space.jpg
setxkbmap -layout us,ru -option grp:alt_shift_toggle -option caps:escape
xsetroot -name " uwu "
slstatus &
exec dwm
