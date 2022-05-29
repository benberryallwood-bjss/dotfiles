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
export NVM_DIR=$HOME/.config/nvm

# ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

# docker
# run in multipass vm
# https://nemzes.net/posts/docker-mac-without-docker-desktop/
export DOCKER_HOST=192.168.64.2

# java
# export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"

# python3.8
# export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# poetry (for python)
# export PATH="/Users/Ben.Berry-Allwood/Library/Python/3.9/bin:$PATH"
