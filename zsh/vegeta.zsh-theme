PROMPT="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})"
PROMPT+=' %{%F{225}%}%c%f%{$reset_color%} $(git_prompt_info)%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%{%F{219}%}%f %{%F{226}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%} %{$fg[blue]%}✔"
