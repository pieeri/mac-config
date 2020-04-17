# ZSH
## Theme
ZSH_THEME="fishy"
## Plugins
### For zsh-syntax-highlighting,
### https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
plugins=(osx git aws docker docker-compose kubectl helm tmux zsh-syntax-highlighting)
## Install
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
## Session history
cat /dev/null > $HOME/.zsh_history
## Aliases
alias zsh-config="code ${HOME}/.zshrc"
alias zsh-reload="exec zsh"

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
)

# PYTHON
## Pyenv
eval "$(pyenv init -)"
## Virtualenvwrapper
export WORKON_HOME=$HOME/.pyenv
eval "pyenv virtualenvwrapper"

# EDITOR
export EDITOR="code"
alias c="code"

echo "$(whoami): customed shell successfully loaded!"
