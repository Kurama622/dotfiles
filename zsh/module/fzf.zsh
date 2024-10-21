! type fzf >/dev/null 2>&1 && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
! type fzf >/dev/null 2>&1 && ~/.fzf/install
# source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh

export FZF_COMPLETION_TRIGGER='\'

# export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up '
export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || bat --style=numbers --color=always --line-range :500 {}"'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .local --exclude .cache'
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || bat --style=numbers --color=always --line-range :500 {}'

FZF_DEFAULT_OPTS+="
  --color=pointer:#ff5050\
  --color=bg+:-1 \
  --color=preview-fg:#01aa24 \
  --color=fg+:#ff5050"

fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --bind ctrl-j:down,ctrl-k:up --color=bg+:-1 -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}
zle -N fzf-history-widget
bindkey '^r' fzf-history-widget
