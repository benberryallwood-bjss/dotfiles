#!/usr/bin/env bash

# ZSH
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/.zshrc ~/.config/zsh/.zshrc
ln -s ~/.dotfiles/zsh/aliases ~/.config/zsh/aliases
ln -s ~/.dotfiles/zsh/completion.zsh ~/.config/zsh/completion.zsh

# Git
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

# Neovim
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s ~/.dotfiles/nvim/.html-template.html ~/.config/nvim/.html-template.html
