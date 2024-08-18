# ZSH
## Automatic Oh-My-Zsh updates
zstyle ':omz:update' mode auto
## Plugins
plugins=(
    macos
    # dotenv
    git
    aws
    docker
    docker-compose
    kubectl
    helm
    # For zsh-syntax-highlighting,
    # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
    zsh-syntax-highlighting
)
## Theme
ZSH_THEME="fishy"
## Settings
ENABLE_CORRECTION="true"
## Install
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
## Session history
cat /dev/null > $HOME/.zsh_history
## Aliases
alias zsh-config="code ${HOME}/.zshrc"
alias zsh-reload="omz reload"

# XDG DIRECTORY
# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# EDITOR
export EDITOR="code -w"
alias c="code"
set -a

# RUST
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo

# PYTHON
## Pyenv
export PYENV_ROOT=$HOME/.pyenv
eval "$(pyenv init -)"
## Default settings
export PIPENV_VENV_IN_PROJECT=true
export POETRY_VIRTUALENVS_IN_PROJECT=true
export PYTHONBREAKPOINT=ipdb.set_trace

# NODE
export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh

# PATH
path=(
    # Homebrew
    /usr/local/bin
    /usr/local/sbin
    # GNU
    /usr/local/opt/gettext/bin
    # Rust
    $CARGO_HOME/bin
    # Postgres
    /Applications/Postgres.app/Contents/Versions/latest/bin
    # OSX
    $path
)

# NOOS
_complete_noosinv() {
    collection_arg=''
    if [[ "${words}" =~ "(-c|--collection) [^ ]+" ]]; then
        collection_arg=$MATCH
    fi
    reply=( $(noosinv ${=collection_arg} --complete -- ${words}) )
}
compctl -K _complete_noosinv + -f noosinv

# TEARDOWN
echo "$(whoami): customed shell successfully loaded!"
