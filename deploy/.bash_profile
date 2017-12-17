# CLEAR
## Last login
touch ~/.hushlogin
## Bash history
cat /dev/null > ~/.bash_history

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
## Via virtualenvwrapper
# source /usr/local/bin/virtualenvwrapper.sh
## Via pyenv-virtualenvwrapper
eval "pyenv virtualenvwrapper"

# ALIASES
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias bashconfig='subl ~/.bash_profile'

# BASH PS1
alias git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"
## Variables
PathShort="\w"
Color_Off="\[\033[0m\]"
Green="\[\033[0;32m\]"
Yellow="\[\033[0;33m\]"
IRed="\[\033[0;91m\]"
BYellow="\[\033[1;33m\]"
## Git customization
export PS1='$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"; \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"; \
  fi)$(git_ps1) '$BYellow$PathShort$Color_Off'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "'$Yellow$PathShort$Color_Off'\$ "; \
fi)'

# SUCCESS
echo $HOME: customed profile has loaded...
