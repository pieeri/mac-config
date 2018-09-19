# CLEAR
## Last login
touch ~/.hushlogin
## Bash history
cat /dev/null > ~/.bash_history

# ALIASES
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias bashconfig='subl ~/.bash_profile'

# SUCCESS
echo $HOME: customed bash profile loaded...
