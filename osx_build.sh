#!/usr/bin/env bash

echo "$(date): starting build..."

# Exit if a command exits with a non-zero status
set -e

# Print commands as they are executed
set -x


# --------
# Homebrew
# --------

echo "$(date): installing homebrew..."

# Check for Homebrew, install if necessary
if test ! $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH
fi

# Update homebrew recipes
brew update


# ----------------------
# GNU command line tools
# ----------------------

echo "$(date): installing GNU utils..."

# Other GNU utilities
GNUS=(
    bat
    gettext
    grep
    htop
    httpie
    jq
    watch
    wget
)
brew install ${GNUS[@]}


# -------------
# Bourne shells
# -------------

echo "$(date): installing Z shell..."

# Z shell
ZSHS=(
    zsh
)
brew install ${ZSHS[@]}

# Check for shell, change if necessary
if test ! $(echo $0 | grep zsh); then
    # Since Mac OS Catalina, Z-shell default shell
    sudo echo $(which zsh) > /etc/shells
    chsh -s $(which zsh)
fi

# Check for Oh-My-Zsh, install if necessary
if test ! -d $HOME/.oh-my-zsh; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi


# -----------------
# Core dev packages
# -----------------

echo "$(date): installing packages..."

PKGS=(
    # Binary build
    cmake
    geckodriver
    git
    libyaml
    pgcli
    sqlite
)
brew install ${PKGS[@]}


# -------------
# Core dev apps
# -------------

echo "$(date): installing applications..."

# Install cask apps
CSKS=(
    1password-cli
    chromedriver
    cyberduck
    dbeaver-community
    docker
    flux
    gitkraken
    iterm2
    orbstack
    postgres
    postman
    slack
    visual-studio-code
)
brew cask install ${CSKS[@]}


# ------
# Python
# ------

echo "$(date): installing Python ecosystem..."

# Install python bins
PYS=(
    python
    pyenv
)
brew install ${PYS[@]}

# Install pipenv & pyenv
if test ! -d $HOME/.pyenv; then
    makedir -p $HOME/.pyenv
fi


# ------
# Devops
# ------

echo "$(date): installing DevOps ecosystem..."

# Install python bins
DEVOPS=(
    argo
    awscli
    circleci
    helm
    k9s
    kubernetes-cli
    terraform
)
brew install ${DEVOPS[@]}


echo "$(date): cleaning up..."
brew cleanup
brew doctor

echo "$(date): build complete!"
