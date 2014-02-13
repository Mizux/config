#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xsetroot -cursor_name left_ptr
setxkbmap fr

export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'
uim-toolbar-gtk &

exec awesome
#exec xmonad

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
