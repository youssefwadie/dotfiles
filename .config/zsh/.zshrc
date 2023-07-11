[[ $- != *i* ]] && return

# History
HISTSIZE=500
SAVEHIST=100000
HISTFILE="$HOME/.cache/zsh/history"

# options
setopt appendhistory nomatch 
setopt autocd extendedglob 		# change directory given just path


# Basic auto/tab completion
autoload -Uz compinit
# menu
zstyle ':completion:*' menu select
# Case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
_comp_options+=(globdots)		# Include hidden files.

# Colors
# Complete . and .. special directories
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zmodload zsh/complist

# extend `help` functionality so that it works on shell builtins and other shell features
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

# Useful functions
[[ -f "$ZDOTDIR/functions.zsh" ]] && source "$ZDOTDIR/functions.zsh"

# Normal files
zsh_add_file "$ZDOTDIR/zsh-vim-mode"

# FZF
zsh_add_file "/usr/share/fzf/completion.zsh"
zsh_add_file "/usr/share/fzf/key-bindings.zsh"

# Shell themes and plugins
zsh_add_file '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
zsh_add_file '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'		# Fish-like autosuggestions

# search repos for programs that can't be found
zsh_add_file '/usr/share/doc/pkgfile/command-not-found.zsh' ]]

# Ranger plugins
zsh_add_file "$XDG_CONFIG_HOME/ranger/plugins/shell_automatic_cd.sh"

# conda completion
# fpath+="$ZDOTDIR/conda-zsh-completion"

# extra shell completions
fpath=(/usr/share/zsh/site-functions/ $fpath)

# aliases and some fundtions
zsh_add_file "$ZDOTDIR/aliases.zsh"
zsh_add_file "$ZDOTDIR/user-functions.zsh"

compinit



# Key-bindings
bindkey -s '^o' 'ranger_cd^M'

# ~/.local/bin/ANSI/$(ls ~/.local/bin/ANSI/ | shuf -n 1)
# if not running intelliji ide or in the tty
if [[ $__INTELLIJ_COMMAND_HISTFILE__  || $TTY =~ /dev/tty* ]]; then
        PS1="[%n@%m %c]$ "
else
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
        source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi

    [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme 			# Powerlevel10k theme
fi

if [[ "${TERM}" != "" && "${TERM}" == "xterm-256color" ]]
then
    precmd()
    {
        # output on which level (%L) this shell is running on.
        # append the current directory (%~), substitute home directories with a tilde.
        # "\a" bell (man 1 echo)
        # "print" must be used here; echo cannot handle prompt expansions (%L)
        print -Pn "\e]0;$(id --user --name)@$(hostname): zsh[%L] %~\a"
    }

    preexec()
    {
        # output current executed command with parameters
        echo -en "\e]0;$(id --user --name)@$(hostname): ${1}\a"
    }
fi

# >>> mamba initialize >>>
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "$MAMBA_ROOT_PREFIX/etc/profile.d/micromamba.sh" ]; then
        . "$MAMBA_ROOT_PREFIX/etc/profile.d/micromamba.sh"
    else
        export  PATH="$MAMBA_ROOT_PREFIX/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<


# Load Angular CLI autocompletion.
source <(ng completion script)
