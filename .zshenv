ZDOTDIR="$HOME/.config/zsh"

# append to path
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH

# set editor to nvim
export EDITOR='nvim'
export VISUAL='nvim'

# Disable .NET telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# conda stuff
export CONDA_ENVS_PATH="$HOME/.conda/envs:/opt/miniconda3/envs"

# Java
export JDK_JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
