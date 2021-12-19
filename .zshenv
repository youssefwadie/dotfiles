ZDOTDIR="$HOME/.config/zsh"

# append to path
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH

# set editor to nvim
export EDITOR='nvim'
export VISUAL='nvim'
export CONDA_ENVS_PATH="$HOME/.conda/envs:/opt/miniconda3/envs"

