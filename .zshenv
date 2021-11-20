ZDOTDIR="$HOME/.config/zsh"

# append to path
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH

# set editor to nvim
export EDITOR='nvim'
export VISUAL='nvim'
export MAMBA_EXE='/usr/bin/micromamba'
export MAMBA_ROOT_PREFIX="$HOME/.micromamba"

