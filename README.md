```bash
mkdir ~/Github
git clone https://github.com/Kurama622/dotfiles.git ~/Github
```

```bash
#!/bin/bash
link_files() {
    local target_dir="$1"
    local paths=("zsh" ".zshrc" "starship.toml" "tmux" "tmuxinator" "alacritty")
    for p in "${paths[@]}"; do
        ln -s "$HOME/Github/dotfiles/$p" "$target_dir/"
    done
}
link_files ~/.config

```


