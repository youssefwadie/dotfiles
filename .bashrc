#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1='\[\e[31m\][\[\e[33m\]\u\[\e[32m\]@\[\e[36m\]\h \[\e[35m\]\W\[\e[31m\]]\[\e[m\]\\$ '
bind 'set completion-ignore-case on'

[[ -f ~/.bash_aliases   ]] && . ~/.bash_aliases
[[ -f ~/.bash_functions ]] && . ~/.bash_functions
[[ -f ~/.complete_alias ]] && . ~/.complete_alias

# ~/.local/bin/ANSI/$(ls ~/.local/bin/ANSI/ | shuf -n 1)
# sh ~/.local/bin/ANSI/elfman

case ${TERM} in

  alacritty*|xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
     PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

