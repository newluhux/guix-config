#!/bin/zsh

. ${HOME}/.zshrc

xset r rate 200 50
xset b off
xsetroot -solid gray
setxkbmap -layout us -option ctrl:nocaps
if [ -e $HOME/.wallpaper ]
then
	feh --bg-scale $HOME/.wallpaper
else
	feh --bg-scale $HOME/.guix-home/profile/share/wallpaper/this-is-freedom-wallpaper.png
fi

emacs --daemon
dunst &

cwm |& tee -a $HOME/.xinitrc.log

killall dunst
