#!/bin/bash

basedir=$(dirname $0)
paths=("zsh" "starship.toml" "tmux" "nvim" "tmuxp" "kitty" "lazygit" "rofi")
for p in "${paths[@]}"; do
  ln -s "$basedir/$p" "$HOME/.config/"
done

ln -s "$basedir/.zshrc" "$HOME/.zshrc"
ln -s "$basedir/git/.gitconfig" "$HOME/.gitconfig"
