#/usr/bin/env bash
cd "$(dirname "$0")"

#
# Install zsh plugin manager
#

#mkdir remote 2> /dev/null
#curl -sSL git.io/antigen > remote/antigen.zsh

#
# Install vim-plug
#

#curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#
# Create vim directories
#

#mkdir -p ~/.config/nvim
mkdir -p .local/share/vim/backup

#
# Create symlinks to config files
#

ln -nsf `realpath ideavimrc` ~/.ideavimrc
#ln -nsf `realpath termite` ~/.config/termite
ln -nsf `realpath vimrc` ~/.vimrc
#ln -nsf `realpath sway` ~/.config/sway
#ln -nsf `realpath waybar` ~/.config/waybar
#ln -nsf `realpath xinitrc` ~/.xinitrc
#ln -nsf `realpath xmonad` ~/.xmonad
#ln -nsf `realpath Xresources` ~/.Xresources
ln -nsf `realpath zshrc` ~/.zshrc
#ln -nsf `realpath Xmodmap` ~/.Xmodmap
#ln -nsf `realpath user-dirs.dirs` ~/.config/user-dirs.dirs

#
# Create common directories
#

# Clone the scripts repo laters
mkdir ~/scripts 2> /dev/null
mkdir ~/bin 2> /dev/null
mkdir ~/repos 2> /dev/null
mkdir ~/tmp 2> /dev/null

echo "Lukas config successfully setup"
