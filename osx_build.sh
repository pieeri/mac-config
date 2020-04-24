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

## Other GNU utilities
GNUS=(
    # coreutils
    # findutils
    bat
    gettext
    htop
    httpie
    hub
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
    gcc
    git
    libyaml
)
brew install ${PKGS[@]}


# -------------
# Core dev apps
# -------------

echo "$(date): installing applications..."

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
    pycharm-ce
    slack
    tower
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
)
brew install ${PYS[@]}

# Install pipenv & pyenv
if test ! -d $HOME/.pyenv; then
    makedir -p $HOME/.pyenv
fi

VENVS=(
    pipenv
    pyenv
    pyenv-virtualenvwrapper
)
brew install ${VENVS[@]}


# ------
# Devops
# ------

echo "$(date): installing DevOps ecosystem..."

# Install python bins
DEVOPS=(
    aws-iam-authenticator
    awscli
    helm
    jsonnet
    kubernetes-cli
    minikube
    pgcli
    terraform
    tflint
    tmux
)
brew install ${DEVOPS[@]}


echo "$(date): cleaning up..."
brew cleanup
brew doctor

echo "$(date): build complete!"
