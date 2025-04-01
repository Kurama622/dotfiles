# Kurama's dotfiles

## Contents

- **Terminal**: `kitty`
- **Shell**: `zsh`, `starship`
- **Screen Manager**: `tmux`, `tmuxp`
- **Editor**: `neovim`

![screenshot](https://github.com/user-attachments/assets/db8b0396-4521-44b1-aa76-00785550b5b1)

## Initialize

```
sudo pacman -S v2raya git-delta neovim tmux tmuxp startship zsh kitty
```

```bash
mkdir ~/Github
git clone https://github.com/Kurama622/dotfiles.git --recursive ~/Github/dotfiles
pushd ~/Github/dotfiles; bash init.sh; popd
```

## proxy

```bash
sudo pacman -S v2raya
```
### subscribe
- https://ghp.ci/raw.githubusercontent.com/Barabama/FreeNodes/main/nodes/nodev2ray.txt

### port
- http: 7890
- socks5: 7891
