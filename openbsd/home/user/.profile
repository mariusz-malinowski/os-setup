#!/bin/sh

[ -f "$HOME/.config/.aliases" ] && . $HOME/.config/.aliases
export PATH

export HISTFILE="$HOME/.config/ksh/.ksh_history"
export HISTSIZE=99999

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_DIRS=${XDG_CONFIG_HOME}:${XDG_CONFIG_HOME}/rofi:${XDG_CONFIG_HOME}/i3wm

export XAUTHORITY="$HOME/.config/.Xauthority"

unset  LC_ALL
export LANG=en_US.UTF-8
export LC_MESSAGES=C
export LC_TIME=pl_PL.UTF-8

export WM="i3wm"
export I3_STATUS_COMMAND="i3status -c $XDG_CONFIG_HOME/i3status/i3status.conf"
export EDITOR="vim"
export TERMINAL="xterm"
export BROWSER="firefox"
export PAGER="less"
export FILE="spacefm"
export READER="zathura"
export COLORTERM="truecolor"
export FONT_SIZE=11
export MAIN_MONITOR="LVDS-1"

export ENV="$HOME/.profile"
