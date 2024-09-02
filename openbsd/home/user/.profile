#!/bin/sh

[ -f "$HOME/.config/.aliases" ] && . $HOME/.config/.aliases

export PATH

export ENV="$HOME/.config/ksh/.kshrc"
export HISTFILE="$HOME/.config/ksh/.ksh_history"
export HISTSIZE=99999

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_DIRS=${XDG_CONFIG_HOME}:${XDG_CONFIG_HOME}/rofi:${XDG_CONFIG_HOME}/i3wm

export XAUTHORITY="$HOME/.config/.Xauthority"

# without X server use US-ASCII (man locale)
export LC_ALL=C

export TERM="xterm-256color"
export COLORTERM="truecolor"

