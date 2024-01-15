#!/usr/bin/sh

mkdir -p $HOME/.config/emacs
sudo ln -s $HOME/dotfiles/etc/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf || true
ln -s $HOME/dotfiles/home/.gitconfig $HOME/.gitconfig || true
ln -s $HOME/dotfiles/home/.zshrc $HOME/.zshrc || true
ln -s $HOME/dotfiles/home/.xinitrc $HOME/.xinitrc || true
ln -s $HOME/dotfiles/home/.config/dunst $HOME/.config/dunst || true
ln -s $HOME/dotfiles/home/.config/emacs/init.el $HOME/.config/emacs/init.el || true
ln -s $HOME/dotfiles/home/.config/neofetch $HOME/.config/neofetch || true
ln -s $HOME/dotfiles/home/.config/picom.conf $HOME/.config/picom.conf || true
