#!/usr/bin/sh

setxkbmap -layout us,ru -option grp:alt_shift_toggle -option caps:escape
feh --no-fehbg --bg-fill wallpapers/retrowave-8.jpg
xsetroot -name " uwu "
slstatus &
picom -b
exec dwm
