#!/bin/zsh

. ${HOME}/.zshrc

xset r rate 200 50
xset b off
xsetroot -solid gray
xkbsetmap -layout us -options ctrl:nocaps

emacs --daemon

cwm |& tee -a $HOME/.xinitrc.log
