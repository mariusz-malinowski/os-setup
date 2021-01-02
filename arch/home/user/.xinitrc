#!/bin/sh

[ -f  "$HOME/.Xresources" ] && xrdb -merge "$HOME/.Xresources"
# nasty hack to inject env vars into i3wm config
xrdb -merge <<EOF
i3wm.main_monitor: $MAIN_MONITOR
i3wm.font_size: $FONT_SIZE
EOF

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
# xsetroot -cursor_name left_ptr

xrandr $XRANDR_SETUP
nitrogen --restore
pgrep -x picom  > /dev/null || picom --config $XDG_CONFIG_HOME/picom/picom.conf &
pgrep -x dunst  > /dev/null || dunst &

case $WM in
  i3wm)
    pgrep -x sxhkd > /dev/null || sxhkd -c $XDG_CONFIG_HOME/sxhkd/sxhkd.conf $XDG_CONFIG_HOME/sxhkd/i3wm-sxhkd.conf &
    # mkdir -p $XDG_DATA_HOME/i3wm
    # START_DATE="$(date +%Y%m%d%H%M%S)"
    # echo "Started at $DATE" >> $XDG_DATA_HOME/i3wm/i3wm.$(echo $START_DATE).log
    # pgrep -x i3   > /dev/null || exec i3 -V -d all -c $XDG_CONFIG_HOME/i3wm/config >> $XDG_DATA_HOME/i3wm/i3wm.$(echo $START_DATE).log
    pgrep -x i3    > /dev/null || exec i3 -c $XDG_CONFIG_HOME/i3wm/i3wm.conf
  ;;
  bspwm)
    pgrep -x sxhkd   > /dev/null || sxhkd -c $XDG_CONFIG_HOME/sxhkd/sxhkd.conf $XDG_CONFIG_HOME/sxhkd/bspwm-sxhkd.conf &
    pgrep -x polybar > /dev/null || polybar -r x220 -c $XDG_CONFIG_HOME/polybar/polybar.conf &
    #pgrep -x polybar > /dev/null || polybar -r first -c $XDG_CONFIG_HOME/polybar/polybar.conf &
    #pgrep -x polybar > /dev/null || polybar -r second -c $XDG_CONFIG_HOME/polybar/polybar.conf &
    pgrep -x bspwm   > /dev/null || exec bspwm
  ;;
esac

