# OH-MY-ZSH
## Theme & Plugins
ZSH_THEME="robbyrussell"
plugins=(osx brew git docker pyenv python pip django zsh-syntax-highlighting)
## Installation
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
## Clear
cat /dev/null > ~/.zsh_history
## Alias
alias zshconfig="subl ~/.zshrc"

# HOMEBREW
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# POSTGRES
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# PYTHON
## Pyenv
eval "$(pyenv init -)"
## Virtualenvwrapper
export WORKON_HOME=$HOME/.pyenv
## Pyenv-virtualenvwrapper
eval "pyenv virtualenvwrapper"

# SUBLIME
export EDITOR='subl_wait'

# SUCCESS
echo $HOME: customed zsh profile loaded...
