#!/usr/bin/env bash

echo "Starting build!"

set -e


# --------
# Homebrew
# --------

echo "Installing homebrew..."

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

echo "Installing GNU utils..."

## Other GNU utilities
GNUS=(
    # coreutils
    # findutils
    gettext
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

echo "Installing Z shell..."

# Z shell
ZSHS=(
    zsh
)
brew ${ZSHS[@]}

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

echo "Installing packages..."

PKGS=(
    git
    libyaml
    tmux
    # Binary build
    gcc
)
brew install ${PKGS[@]}


# -------------
# Core dev apps
# -------------

echo "Installing applications..."

# Install cask apps
CSKS=(
    cyberduck
    docker
    flux
    iterm2
    joplin
    openoffice
    postgres
    postman
    pycharm-edu
    slack
    tower
    visual-studio-code
)
brew cask install ${CSKS[@]}


# ------
# Python
# ------

echo "Installing Python ecosystem..."

# Install python bins
PYS=(
    python
)
brew install ${PYS[@]}

# Install pipenv & pyenv
if test ! -d $HOME/.pyenv; then
    makedir -p $HOME/.pyenv
fi

ENVS=(
    pyenv
    pyenv-virtualenvwrapper
    pipenv
)
brew install ${ENVS[@]}


# ------
# Devops
# ------

echo "Installing DevOps ecosystem..."

# Install python bins
DEV=(
    pgcli
    awscli
    kubectl
    helm
    jsonnet
    minikube
    terraform
    aws-iam-authenticator
)
brew install ${DEV[@]}


echo "Cleaning up..."
brew cleanup
brew doctor

echo "Build complete"
