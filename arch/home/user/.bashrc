#/usr/bin/env bash

print_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS0="\[\e[m\]"
PS1='\[\e[1;m\][\[\e[m\]\[\e[32m\]\D{%Y-%m-%d}\[\e[m\] \[\e[34m\]\D{%H:%M:%S}\[\e[m\]\[\e[1;m\]]\[\e[m\] \[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[1;35m\]$(print_git_branch)\[\e[m\] \n\[\e[1;34m\]λ>\[\e[m\] \[\e[33m\]'
HISTSIZE=99999
HISTFILESIZE=999999
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
shopt -s checkwinsize ; # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
#PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

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

command -v fzf &> /dev/null && source /usr/share/fzf/key-bindings.bash
command -v fzf &> /dev/null && source /usr/share/fzf/completion.bash

