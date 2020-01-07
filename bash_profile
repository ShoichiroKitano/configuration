source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
PS1='\W$(__git_ps1)$ '

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH="$HOME/.cargo/bin:$HOME/.pub-cache/bin:$PATH"
export GOPATH="$HOME/project/gomodule"
export GO111MODULE=on
export GOENV_DISABLE_GOPATH=1
export JAVA_HOME=`/usr/libexec/java_home -v 12`

. `brew --prefix`/etc/profile.d/z.sh
    function precmd () {
    _z --add "$(pwd -P)"
}

[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

export BASH_SILENCE_DEPRECATION_WARNING=1
