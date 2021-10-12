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

# Install vim-plug
sh -c 'curl -fLo ~/.config/local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install neovim plugins
nvim -c PlugInstall
