#!/bin/bash

paths=("zsh" "starship.toml" "tmux" "tmuxinator" "alacritty" "nvim" "tmuxp")
for p in "${paths[@]}"; do
  ln -s "$HOME/Github/dotfiles/$p" "$HOME/.config/"
done

ln -s "$HOME/Github/dotfiles/.zshrc" "$HOME/.zshrc"
