#!/usr/bin/env bash

# This script symlinks the config directories in lconfig to their correct place
# Author: Lukas Klingsbo (Spydon)

# Useful packages for fresh installs:
# xmonad xmobar mmenu urxvt zsh oh-my-zsh nvim firefox pacmanfm scrot
# fehx backlight sublime3 powerline-fonts

#
# Create symlinks to config files
#

cd "$(dirname "$0")"
ln -s nvim ~/.config/nvim
ln -s `realpath xinitrc` ~/.xinitrc
ln -s `realpath zshrc` ~/.zshrc
ln -s `realpath Xresources` ~/.Xresources
ln -s `realpath xmonad` ~/.xmonad

#
# Create common directories
#

mkdir ~/bin
mkdir ~/docs
mkdir ~/repos
mkdir ~/scripts # Clone the scripts repo later
mkdir ~/tmp
mkdir ~/usb
