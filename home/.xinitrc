#!/bin/zsh

. ${HOME}/.zshrc

xset r rate 200 50
xset b off
xsetroot -solid gray
xkbsetmap -layout us -options ctrl:nocaps

emacs --daemon

rio -term ${HOME}/bin/launcher -font $font |& tee -a ${HOME}/.xinitrc.log
