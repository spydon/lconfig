#!/usr/bin/env bash

cd "$(dirname "$0")"

#
# Install zsh plugin manager
#

mkdir remote 2> /dev/null
curl -sSL git.io/antigen > remote/antigen.zsh

#
# Create symlinks to config files
#

ln -nsf `realpath termite` ~/.config/termite
ln -nsf `realpath vimrc` ~/.vimrc
ln -nsf `realpath xinitrc` ~/.xinitrc
ln -nsf `realpath xmonad` ~/.xmonad
ln -nsf `realpath Xresources` ~/.Xresources
ln -nsf `realpath zshrc` ~/.zshrc

#
# Create common directories
#

# Clone the scripts repo laters
mkdir ~/scripts 2> /dev/null
mkdir ~/bin 2> /dev/null
mkdir ~/docs 2> /dev/null
mkdir ~/repos 2> /dev/null
mkdir ~/tmp 2> /dev/null
mkdir ~/usb 2> /dev/null

echo "Lukas config successfully setup"
