#!/bin/bash

paths=("zsh" "starship.toml" "tmux" "tmuxinator" "alacritty" "nvim" "tmuxp" "kitty")
for p in "${paths[@]}"; do
  ln -s "$HOME/Github/dotfiles/$p" "$HOME/.config/"
done

ln -s "$HOME/Github/dotfiles/.zshrc" "$HOME/.zshrc"
ln -s "$HOME/Github/dotfiles/git/.gitconfig" "$HOME/.gitconfig"
