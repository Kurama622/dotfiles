#!/bin/bash

paths=("zsh" ".zshrc" "starship.toml" "tmux" "tmuxinator" "alacritty" "nvim")
for p in "${paths[@]}"; do
  ln -s "$HOME/Github/dotfiles/$p" "$HOME/.config/"
done
