#!/usr/bin/sh

set -xe

sudo pacman -Sy
sudo pacman -S xorg xorg-xinit i3 \
     ly polybar picom dunst rofi \
     brightnessctl bluez bluez-utils wget \
     alacritty emacs rustup

sudo systemctl enable ly.service bluetooth.service
sudo systemctl start bluetooth.service

wget git.io/trans
chmod +x ./trans
md -p ~/.local/bin/
mv ./trans ~/.local/bin/
sudo pacman -R wget

rustup install stable
~/.cargo/bin/cargo install exa
