[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xrdb -merge ~/.Xresources
compton -b
unclutter -idle 1 &
exec xmonad
