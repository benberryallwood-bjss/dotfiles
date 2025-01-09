# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Homebrew
export HOMEBREW_BUNDLE_FILE="$HOME/.dotfiles/Brewfile"
export PATH="/usr/local/sbin:$PATH"

# dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT="1"

# azure functions
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT="1"

# ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

# scripts
export PATH="$PATH:$HOME/.scripts"

# spark
export SPARK_LOCAL_IP="127.0.0.1"

# cargo
. "$HOME/.cargo/env"

# uv
export PATH="$HOME/.config/local/bin:$PATH"
