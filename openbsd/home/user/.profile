#!/bin/sh

[ -f "$HOME/.config/.aliases" ] && . $HOME/.config/.aliases
export PATH

export WM="i3wm"
export EDITOR="vim"
export TERMINAL="xterm"
export BROWSER="firefox"
export PAGER="less"
export FILE="spacefm"
export READER="zathura"
export COLORTERM="truecolor"
export FONT_SIZE=11
export MAIN_MONITOR="LVDS-1"

export HISTFILE="$HOME/.config/ksh/.ksh_history"
export HISTSIZE=99999

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}

export XAUTHORITY="$HOME/.config/.Xauthority"

unset  LC_ALL
export LANG=en_US.UTF-8
export LC_MESSAGES=C
export LC_TIME=pl_PL.UTF-8

export ENV="$HOME/.profile"