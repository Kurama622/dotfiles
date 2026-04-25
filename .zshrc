### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

if [ $SHELL != "/bin/zsh" ]; then
	chsh -s /bin/zsh
fi

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit snippet OMZ::lib/history.zsh

# 语法高亮
zinit ice wait lucid atinit='zpcompinit'
zinit light zdharma-continuum/fast-syntax-highlighting

# 自动建议
zinit ice wait lucid atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 补全
zinit ice lucid wait='1'
zinit light zsh-users/zsh-completions
# source ~/.config/zsh/module/completions.zsh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export HIP_PATH="/opt/rocm/hip"
export PATH="$PATH:/opt/rocm/bin:$HIP_PATH/bin:$HOME/.local/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
export XDG_CONFIG_HOME="$HOME/.config"
export DEBUG_CODEIUM="info" # just for codeium.nvim
# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/arch/.lmstudio/bin"
# End of LM Studio CLI section


zinit snippet OMZ::lib/key-bindings.zsh

setopt autocd		# Automatically cd into typed directory.
# bash ~/scripts/setxkbmap-qwery.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.config/zsh/module/aliases.zsh
source ~/.config/zsh/module/fzf.zsh

export RANGER_LOAD_DEFAULT_RC=false
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

source ~/.config/zsh/module/proxy.zsh

git config --global diff.tool nvimdiff
git config --global difftool.prompt true
git config --global difftool.nvimdiff.cmd "nvim -d \"\$LOCAL\" \"\$REMOTE\""
git config --global alias.d difftool

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

source ~/.config/zsh/module/func.zsh

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

eval "$(dircolors -b)"
LS_COLORS="$LS_COLORS:di=38;5;110:\
ln=38;5;245:\
ex=38;5;71:\
fi=38;5;250:\
pi=38;5;179:\
so=38;5;103:\
bd=38;5;173:cd=38;5;173:or=38;5;167:mi=38;5;167:\
*.tar=38;5;173:*.gz=38;5;173:*.zip=38;5;173:\
*.jpg=38;5;186:*.png=38;5;186:\
*.mkv=38;5;65:*.gif=38;5;65:*.mp4=38;5;65"
export LS_COLORS
