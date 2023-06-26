#!/bin/sh

xset r rate 200 50
xset b off
xsetroot -solid gray
xkbsetmap -layout us -options ctrl:nocaps

emacs --daemon

exec dbus-launch cwm
