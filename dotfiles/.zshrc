# OH-MY-ZSH
## Automatic Oh-My-Zsh updates
zstyle ':omz:update' mode auto
## Plugins
plugins=(
    macos
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
alias cu="cursor"
alias setenv="set -a && source .env"
alias unsetenv="set +a"

# PYTHON
## Pyenv
export PYENV_ROOT=$HOME/.pyenv
eval "$(pyenv init - zsh)"
## Default settings
export PIPENV_VENV_IN_PROJECT=true
export POETRY_VIRTUALENVS_IN_PROJECT=true
export PYTHONBREAKPOINT=ipdb.set_trace

# RUST
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo

# NODE
export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh

# PATH
path=(
    # Rust
    $CARGO_HOME/bin
    # OSX
    $path
)

# NOOS
export NOOSINV_LOCAL_CONFIG=$HOME/.noos/config.json
_complete_noosinv() {
    collection_arg=''
    if [[ "${words}" =~ "(-c|--collection) [^ ]+" ]]; then
        collection_arg=$MATCH
    fi
    reply=( $(noosinv ${=collection_arg} --complete -- ${words}) )
}
compctl -K _complete_noosinv + -f noosinv
alias nooslint="noosinv python.format && noosinv python.lint"

# TEARDOWN
echo "$(whoami): customed shell successfully loaded!"
