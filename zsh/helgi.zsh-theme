# PROMPT='%B%{$fg[black]%}[%*] %{$fg[green]%}%n@%m%{$reset_color%} » [%{$fg[blue]%}$(zsh ~/.oh-my-zsh/path.zsh -l -t)%{$reset_color%}]%(!.#.$) '
PROMPT='%B%{$fg[black]%}[%*] %{$fg[green]%}%n@%m%{$reset_color%} » [%{$fg[blue]%}$(zsh ~/.oh-my-zsh/path.zsh -l -t)%{$reset_color%}]$(git_prompt_info)%(!.#.$) '

PROMPT2="%{$fg_blod[black]%}%_> %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
