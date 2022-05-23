#!/bin/sh

[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
[ -f "$HOME/.bindings" ] && source "$HOME/.bindings"
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"
[ -d "$LOCAL_BIN" ] && PATH="$PATH:$LOCAL_BIN"
export PATH

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_DIRS=${XDG_CONFIG_HOME}:${XDG_CONFIG_HOME}/rofi:${XDG_CONFIG_HOME}/i3wm

unset  LC_ALL
export LANG=en_US.UTF-8
export LC_MESSAGES=C
export LC_TIME=pl_PL.UTF-8

# export HISTFILE="${XDG_DATA_HOME}/bash/history"
# export LESSHISTFILE="${XDG_DATA_HOME}/.less-history"

export MOZ_GTK_TITLEBAR_DECORATION=client
#export MOZ_X11_EGL=1
export AWT_TOOLKIT=XToolkit ; # Use XToolkit in java applications
export DMENU_FONT="pango:monospace:bold:pixelsize=24"
export SUDO_ASKPASS="$LOCAL_BIN/dmenu-sudoaskpass"

if [ "$(tty)" = "/dev/tty1" ]; then
  #pgrep bspwm || startx "$XDG_CONFIG_HOME/X11/xinitrc"
  pgrep -x i3 || pgrep -x bspwm || startx
fi

