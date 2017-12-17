# OH-MY-ZSH
## Theme
ZSH_THEME="robbyrussell"
## Plugins
plugins=(osx brew git python pip pyenv django zsh-syntax-highlighting)
## Installation
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# CLEAR
## Last login
touch ~/.hushlogin
## Zsh history
cat /dev/null > ~/.zsh_history

# SUBLIME
export EDITOR='subl_wait'

# HOMEBREW
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# POSTGRES
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# PYTHON
## Overwrite MacOS
export PATH=/usr/local/opt/python/libexec/bin:$PATH
## Pyenv
eval "$(pyenv init -)"
## Virtualenvwrapper
export WORKON_HOME=$HOME/.pyenv
## Via pyenv-virtualenvwrapper
eval "pyenv virtualenvwrapper"

# ALIASES
alias zshconfig="subl ~/.zshrc"

# SUCCESS
echo $HOME: customed profile has loaded...
