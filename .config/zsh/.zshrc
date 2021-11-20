[[ $- != *i* ]] && return

# History
HISTSIZE=500
SAVEHIST=100000
HISTFILE="$ZDOTDIR/.histfile"
setopt APPEND_HISTORY

# Basic auto/tab completion
autoload -Uz compinit
# menu
zstyle ':completion:*' menu select
# Case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# Colors
# Complete . and .. special directories
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zmodload zsh/complist

# conda completion
fpath+="$ZDOTDIR/conda-zsh-completion"

compinit
_comp_options+=(globdots)		# Include hidden files

# get help
autoload -Uz run-help
# unalias run-help
alias help='run-help'

# options
setopt autocd extendedglob 		# change directory given just path

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Key-bindings
bindkey -s '^o' 'ranger_cd^M'


# extra files
[[ -f "$ZDOTDIR/.zsh_aliases"   ]] && source "$ZDOTDIR/.zsh_aliases"
[[ -f "$ZDOTDIR/.zsh_functions" ]] && source "$ZDOTDIR/.zsh_functions"


# Shell themes and plugins
[[ -f '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 	# Fish-like syntax highlighting
[[ -f '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' ]] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 		# Fish-like autosuggestions
# search repos for programs that can't be found
[[ -f '/usr/share/doc/pkgfile/command-not-found.zsh' ]] && source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

# Ranger plugins
[[ -f "$HOME/.config/ranger/plugins/shell_automatic_cd.sh" ]] && source "$HOME/.config/ranger/plugins/shell_automatic_cd.sh"

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

if [[ "${TERM}" != "" && "${TERM}" == "alacritty" ]]
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


