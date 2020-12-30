#!/bin/sh

[ -f  "$HOME/.Xresources" ] && xrdb "$HOME/.Xresources"

# check man xkeyboard-config
setxkbmap pl,de \
  -option grp:alt_space_toggle \
  -option compose:rctrl \
  -option ctrl:nocaps
numlockx on
xset -dpms ; # Disable DPMS (Display Power Management Singaling)
xset s noblank ; # Do not blank the video device
xset s off ; # Disable the screen saver
xset -b ; # Disable bell
xsetroot -solid "#333333" ; # Set background color
xsetroot -cursor_name left_ptr

#xrandr   --output DisplayPort-0 --auto --output DisplayPort-1 --auto --right-of DisplayPort-0
nitrogen --restore
pgrep -x picom  > /dev/null || picom &
pgrep -x dunst  > /dev/null || dunst &
pgrep -x sxhkd  > /dev/null || sxhkd &

case $WM in
  i3wm)
    mkdir -p ~/.local/share/i3
    START_DATE="$(date +%Y%m%d%H%M%S)"
    echo "Started at $DATE" >> ~/.local/share/i3/i3.$(echo $START_DATE).log
    pgrep -x i3 > /dev/null || exec i3 -V -d all -c ~/.config/i3/i3.conf >> ~/.local/share/i3/i3.$(echo $S
TART_DATE).log
  ;;
  bspwm)
    pgrep -x polybar  > /dev/null || polybar -r x220 &
    #pgrep -x polybar > /dev/null || polybar first &
    #pgrep -x polybar > /dev/null || polybar second &
    pgrep -x bspwm    > /dev/null || exec bspwm
  ;;
esac

