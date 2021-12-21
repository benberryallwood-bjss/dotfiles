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
export HOMEBREW_BUNDLE_FILE="~/.dotfiles/Brewfile"

# dotnet
export DOTNET_ROOT="/usr/local/opt/dotnet/libexec"
export DOTNET_CLI_TELEMETRY_OPTOUT="1"

# nvm
export NVM_DIR="$HOME/.config/nvm"
