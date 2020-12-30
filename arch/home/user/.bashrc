# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '
HISTCONTROL=ignoreboth ; # don't put duplicate lines or lines starting with space in the history
HISTSIZE=9999
HISTFILESIZE=9999

shopt -s histappend ; # append to the history file, don't overwrite it
shopt -s checkwinsize ; # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

source ~/.bash_completion

