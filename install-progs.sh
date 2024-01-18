#!/usr/bin/bash

set -xe

sudo pacman -Syu
sudo pacman -S xorg xorg-xinit ly picom dunst feh brightnessctl bluez bluez-utils \
     pipewire pipewire-audio pipewire-jack pipewire-pulse wireplumber \
     emacs firefox zsh zsh-autosuggestions zsh-syntax-highlighting \
     telegram-desktop discord flameshot unzip man-pages neofetch make

sudo systemctl enable ly bluetooth
sudo systemctl start bluetooth.service
systemctl --user --now enable pipewire pipewire-pulse

chsh -s /usr/bin/zsh

sudo pacman -S wget

wget git.io/trans
chmod +x ./trans
sudo mv ./trans /usr/local/bin

sudo pacman -Rssn wget
rm ~/.wget-hsts
