#/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#PS1='[\u@\h \W]\$ '
PS1='\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]> '
HISTCONTROL=ignoreboth ; # don't put duplicate lines or lines starting with space in the history
HISTSIZE=9999
HISTFILESIZE=9999

shopt -s histappend ; # append to the history file, don't overwrite it
shopt -s checkwinsize ; # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

[ -f "$HOME/.bash_completion" ] && source "$HOME/.bash_completion"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
  source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

[ -s "$HOME/.bashrc_aux" ] && source $HOME/.bashrc_aux

# end of .bashrc

