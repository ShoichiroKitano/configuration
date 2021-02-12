. /usr/share/bash-completion/completions/git
GIT_PS1_SHOWDIRTYSTATE=true
PS1='\W$(__git_ps1)$ '

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
