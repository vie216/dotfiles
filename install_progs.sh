#!/usr/bin/sh

set -xe

sudo pacman -Syu
sudo pacman -S xorg xorg-xinit i3 \
     ly polybar picom dunst rofi feh \
     brightnessctl bluez bluez-utils wget \
     alacritty emacs firefox rustup flameshot \
     zsh zsh-autosuggestions zsh-syntax-highlighting \
     pipewire pipewire-jack pipewire-alsa pipewire-pulse

sudo systemctl enable ly.service bluetooth.service
sudo systemctl start bluetooth.service
systemctl --user --now enable pipewire pipewire-pulse pipewire-media-session

chsh -s /usr/bin/zsh

rustup install stable
rustup component add rust-analyzer
cargo install exa

wget git.io/trans
chmod +x ./trans
mkdir -p ~/.local/bin/
mv ./trans ~/.local/bin/
sudo pacman -Rssn wget
rm ~/.wget-hsts
