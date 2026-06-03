#!/bin/bash

paths=("zsh" "starship.toml" "tmux" "nvim" "tmuxp" "kitty" "lazygit" "rofi")
for p in "${paths[@]}"; do
  ln -s "$PWD/$p" "$HOME/.config/"
done

ln -s "$PWD/.zshrc" "$HOME/.zshrc"
ln -s "$PWD/git/.gitconfig" "$HOME/.gitconfig"
