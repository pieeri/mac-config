# ZSH
## Theme
ZSH_THEME="fishy"
## Plugins
### For zsh-syntax-highlighting,
### https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
plugins=(osx git aws docker docker-compose kubectl zsh-syntax-highlighting)
## Install
export ZSH=${HOME}/.oh-my-zsh
source ${ZSH}/oh-my-zsh.sh
## Clear
cat /dev/null > ${HOME}/.zsh_history
## Aliases
alias zsh-config="code ${HOME}/.zshrc"
alias zsh-reload="source ${HOME}/.zshrc"

# EDITOR
export EDITOR="code"

# KUBECTL
alias k="kubectl"

# HOMEBREW
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# GNU
export PATH=$PATH:/usr/local/opt/gettext/bin

# POSTGRES
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# PYTHON
## Pyenv
eval "$(pyenv init -)"
## Virtualenvwrapper
export WORKON_HOME=${HOME}/.pyenv
eval "pyenv virtualenvwrapper"

# SUCCESS
echo "$(whoami): customed profile has loaded..."
