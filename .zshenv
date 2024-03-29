# ZSH
export ZDOTDIR="$HOME/.config/zsh"

# append to path
typeset -U path PATH
path=($path "$HOME/.local/bin" "$HOME/java/jdk/graalvm-ce-java17/bin" "$HOME/java/keycloak-current/bin" "$HOME/.local/node/bin")
export PATH

# set editor to nvim
export EDITOR='nvim'
export VISUAL='nvim'

# Disable .NET telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Java
export JAVA_HOME="/usr/lib/jvm/java-17-temurin"
export ORACLE_HOME="$HOME/oracle/middleware/oracle_home"

# export JDK_JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

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
export CHROME_BIN="/usr/bin/chromium"

# api keys
source "$HOME/.api-keys"

# hagz secrets
source "$HOME/.hagz-secrets"

