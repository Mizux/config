#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xsetroot -cursor_name left_ptr
setxkbmap fr

exec awesome
#exec xmonad

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
