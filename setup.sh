#!/usr/bin/env bash

# This script symlinks the config directories in lconfig to their correct place
# Author: Lukas Klingsbo (Spydon)

cd "$(dirname "$0")"

# Useful packages for fresh installs:
# xmonad xmobar mmenu urxvt terminator termite zsh antigen nvim firefox
# pacmanfm scrot feh backlight sublime3 powerline-fonts intellij tridactyl
# compton

#
# Install things
#

mkdir remote 2> /dev/null
curl -sSL git.io/antigen > remote/antigen.zsh

#
# Create symlinks to config files
#

ln -nsf `realpath nvim` ~/.config/nvim
ln -nsf `realpath termite` ~/.config/termite
ln -nsf `realpath xinitrc` ~/.xinitrc
ln -nsf `realpath zshrc` ~/.zshrc
ln -nsf `realpath Xresources` ~/.Xresources
ln -nsf `realpath xmonad` ~/.xmonad

#
# Create common directories
#

# Clone the scripts repo laters
mkdir ~/script 2> /dev/null
mkdir ~/bin 2> /dev/null
mkdir ~/docs 2> /dev/null
mkdir ~/repos 2> /dev/null
mkdir ~/tmp 2> /dev/null
mkdir ~/usb 2> /dev/null

echo "Lukas config successfully setup"
