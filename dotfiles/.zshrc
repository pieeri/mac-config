# ZSH
## Theme
ZSH_THEME="fishy"
## Plugins
### For zsh-syntax-highlighting,
### https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
plugins=(macos git aws docker docker-compose kubectl kube-ps1 helm tmux zsh-syntax-highlighting)
## Automatic Oh-My-Zsh updates
zstyle ':omz:update' mode auto
## Install
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
## Settings
ENABLE_CORRECTION="true"
## Session history
cat /dev/null > $HOME/.zsh_history
## Aliases
alias zsh-config="code ${HOME}/.zshrc"
alias zsh-reload="omz reload"

# GOLANG
export GOPATH=$HOME/Checkouts/go

# NODE
export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh

# PYTHON
## Pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
## Virtualenvwrapper
export WORKON_HOME=$HOME/.pyenv
eval "pyenv virtualenvwrapper"
## Default debugger
export PYTHONBREAKPOINT=ipdb.set_trace

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
## POETRY
    $HOME/.poetry/bin
## KREW
    $HOME/.krew/bin
)

# ENV
set -a

# EDITOR
export EDITOR="code -w"
alias c="code"

# PROMPT
PROMPT='$(kube_ps1)'$PROMPT

# NOOS
_complete_noosinv() {
    collection_arg=''
    if [[ "${words}" =~ "(-c|--collection) [^ ]+" ]]; then
        collection_arg=$MATCH
    fi
    reply=( $(noosinv ${=collection_arg} --complete -- ${words}) )
}
compctl -K _complete_noosinv + -f noosinv

# Setup complete!
echo "$(whoami): customed shell successfully loaded!"
