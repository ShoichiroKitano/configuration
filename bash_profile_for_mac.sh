. /usr/local/etc/bash_completion.d/git-prompt.sh
. /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
PS1='\W$(__git_ps1)$ '


export PATH="$HOME/.anyenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$HOME/.pub-cache/bin:$PATH" # for homebrew rust
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH" # for homebrew mysql5.7
export PATH="/usr/local/opt/binutils/bin:$PATH" # for homebrew binutils
export PATH="/usr/local/opt:$PATH" # for homebrew gcc & g++ by symlink
export DYLD_LIBRARY_PATH=/usr/local/opt/gcc@10/lib/gcc/10 # for homebrew gcc & g++ library path(.dylib)
export CPATH=/usr/local/include # for homebrew gcc & g++ include path(.h)
export LIBRARY_PATH=/usr/local/lib # for homebrew gcc & g++ library path(.dylib)

eval "$(anyenv init -)"

export GOPATH="$HOME/project/gomodule"
export GO111MODULE=on
export GOENV_DISABLE_GOPATH=1
export JAVA_HOME=`/usr/libexec/java_home -v 12`

. `brew --prefix`/etc/profile.d/z.sh
    function precmd () {
    _z --add "$(pwd -P)"
}

[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

export BASH_SILENCE_DEPRECATION_WARNING=1 # stop warning of zsh migration
