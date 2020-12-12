# ZSH
## Theme
ZSH_THEME="fishy"
## Plugins
### For zsh-syntax-highlighting,
### https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
plugins=(osx git aws docker docker-compose kubectl kube-ps1 helm tmux zsh-syntax-highlighting)
## Install
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
## Session history
cat /dev/null > $HOME/.zsh_history
## Aliases
alias zsh-config="code ${HOME}/.zshrc"
alias zsh-reload="exec zsh"

# PYTHON
## Pyenv
eval "$(pyenv init -)"
## Virtualenvwrapper
export WORKON_HOME=$HOME/.pyenv
eval "pyenv virtualenvwrapper"

# GOLANG
export GOPATH=$HOME/Checkouts/go

# NODE
export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh

# ENV
set -a

# PROMPT
PROMPT='$(kube_ps1)'$PROMPT

# PATH
path=(
## HOMEBREW
    /usr/local/bin
    /usr/local/sbin
## OSX
    $path
## GNU
    /usr/local/opt/gettext/bin
## POSTGRES
    /Applications/Postgres.app/Contents/Versions/latest/bin
## GO
    $GOPATH/bin
)

# EDITOR
export EDITOR="code"
alias c="code"

# NOOS
_complete_noosci() {
    collection_arg=''
    if [[ "${words}" =~ "(-c|--collection) [^ ]+" ]]; then
        collection_arg=$MATCH
    fi
    reply=( $(noosci ${=collection_arg} --complete -- ${words}) )
}
compctl -K _complete_noosci + -f noosci

echo "$(whoami): customed shell successfully loaded!"
