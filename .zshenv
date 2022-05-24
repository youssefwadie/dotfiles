# ZSH
export ZDOTDIR="$HOME/.config/zsh"

# append to path
typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/.local/node/bin" "$path[@]")
export PATH

# set editor to nvim
export EDITOR='nvim'
export VISUAL='nvim'

# Disable .NET telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Java
export JDK_JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# micromamba stuff
export MAMBA_EXE="/usr/bin/micromamba"
export MAMBA_ROOT_PREFIX="$HOME/.micromamba"

# Node
export npm_config_prefix="$HOME/.local/node"

