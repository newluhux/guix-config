#!/bin/zsh

eval `dbus-launch --sh-syntax`

export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
fcitx5 -d -r

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
conky -d -c $HOME/.config/conky/conkyrc

cwm |& tee -a $HOME/.xinitrc.log

killall dunst
killall conky
