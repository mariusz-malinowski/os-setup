#!/bin/sh

# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
# export TERMINAL="xterm"
export TERMINAL="urxvt"
export FILE="vifm"
export EDITOR="vim"
export BROWSER="firefox"
export SUDO_ASKPASS="$HOME/.local/bin/dmenu-sudoaskpass"
export DMENU_FONT="pango:monospace:bold:pixelsize=24"

# check man xkeyboard-config
setxkbmap pl,de \
  -option grp:alt_space_toggle \
  -option compose:rctrl \
  -option ctrl:nocaps &
numlockx on &
xset -dpms &
xset s off &
xset -b
# xmodmap -e "add lock = Caps_Lock" &


# install misc/qt5ct to configure qt5 themes
export QT_QPA_PLATFORMTHEME="qt5ct"
export MOZ_GTK_TITLEBAR_DECORATION=client

# load .Xresources configuration
xrdb -merge .Xresources &

# I use x11/rxvt-unicode for my terminal emulator - you can run a server process to conserve resources.
urxvtd -q -f -o &
compton &
xrandr --output DisplayPort-0 --auto --output DisplayPort-1 --auto --right-of DisplayPort-0 &
nitrogen --head=0 --set-zoom-fill ~/wallpapers/close-up-photography-of-bulb-on-water-1213447.jpg && nitrogen --head=1 --set-zoom-fill ~/wallpapers/close-up-photo-of-brown-textile-1460890.jpg &

exec i3
