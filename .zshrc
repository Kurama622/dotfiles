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
zinit ice lucid wait='1' atinit='zpcompinit'
zinit light zdharma-continuum/fast-syntax-highlighting

# 自动建议
zinit ice lucid wait="1" atload='_zsh_autosuggest_start'
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
export PATH="$PATH:/opt/rocm/bin:$HIP_PATH/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"


zinit snippet OMZ::lib/key-bindings.zsh

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
