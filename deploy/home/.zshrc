# OH-MY-ZSH
## Theme & Plugins
ZSH_THEME="robbyrussell"
plugins=(osx brew git docker pyenv python pip django zsh-syntax-highlighting)
## Installation
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
## Alias
alias zshconfig="subl ~/.zshrc"

# HOMEBREW
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# POSTGRES
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# PYTHON
## Pyenv
export WORKON_HOME=$HOME/.pyenv
eval "$(pyenv init -)"
## Venv via pyenv-virtualenvwrapper
eval "pyenv virtualenvwrapper"
## Venv via pipenv
eval "$(pipenv --completion)"

# SUBLIME
export EDITOR='subl_wait'

# CLEAR
## Last login
touch ~/.hushlogin
## Zsh history
cat /dev/null > ~/.zsh_history

# SUCCESS
echo $HOME: customed profile has loaded...
