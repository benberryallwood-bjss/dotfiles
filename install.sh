#!/usr/bin/env bash

# Install Apple Command Line Tools
# xcode-select --install

# Clone repo into new directory
# git clone https://github.com/benberryallwood-bjss/dotfiles.git ~/.dotfiles

# Create symlinks to dotfiles in new repo
~/.dotfiles/create-symlinks.sh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then bundle
brew bundle --file ~/.dotfiles/Brewfile
