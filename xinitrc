[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xrdb -merge ~/.Xresources
compton -b
exec xmonad
