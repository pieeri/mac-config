# MyMac Setup

## Rebuild script

### Show hidden files
Launch any terminal and run:

    $ defaults write com.apple.finder AppleShowAllFiles YES; killall Finder

### Development environment
If a Bourne-shell (`bash`) is installed with `make` utils, execute:

    $ make build

And copy configuration files across:

    $ make install

## Manual installation

### Install [Homebrew](http://brew.sh/#install/)
Launch terminal and execute:

	$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

> with the latest Homebrew version (2.2.2),
- Apple's Xcode will be downloaded automatically,
- once the bootstrap script has installed the `brew` executable,
- while the `core` and `cask` taps are installed by default.

In `$PATH`, make sure `/usr/local/bin` is before `/usr/bin`:

```bash
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
```

### Install [Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
With *Homebrew* setup as the default package manager:

    $ brew install zsh

> with MacOS Catalina,
- Apple base shell has been switched to the Z-shell.

Allow system to access the shell and make *Z-shell* the defaut shell:

    $ sudo echo $(which zsh) > /etc/shells
    $ chsh -s $(which zsh)

In order to switch back to the *Bourne-shell*:

    $ chsh -s $(which bash)

### Install [Oh-My-Zsh](http://ohmyz.sh)
Launch terminal and execute:

    $ sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

### Install [Pyenv](https://github.com/pyenv/pyenv-virtualenvwrapper)
To get *Pyenv* installed:

	$ brew install pyenv pyenv-virtualenvwrapper

And make sure to add the following into your `~/.zshrc`:

```bash
# Pyenv
eval "$(pyenv init -)"
# Pyenv-virtualenvwrapper
export WORKON_HOME=${HOME}/.pyenv
eval "pyenv virtualenvwrapper"
```

### Install [Rbenv](https://github.com/rbenv/rbenv)
To get *Rbenv* installed:

    $ brew install rbenv

And make sure to add the following into your `~/.zshrc`:

```bash
# Rbenv
eval "$(rbenv init -)"
```

# Lastly... cheatsheet! #

### Generate SSH keys
Either generate key pair `id_rsa` / `id_rsa.pub` via *ssh agent*:

    $ ssh-keygen -t rsa -b 4096 -C "label"
    $ eval "$(ssh-agent -s)"
    $ ssh-add -K ~/.ssh/id_rsa

Or copy-over existing keys:

	$ chmod 400 id_rsa
	$ chmod 400 id_rsa.pub

### Autoreload iPython shell
Install *iPython* in a Python virtual environment and generate a profile,

    $ ipython profile create

Then amend the configuration file (found at `~/.ipython/profile_default/`)

### Django Shell_plus for PyCharm
Enable Django support in **Languages & Frameworks > Django**,

Then add the the following starting script in **Build, Execution, Deployment > Django Console**,

```python
import sys

print(f"Python {sys.version} on {sys.platform}")
sys.path.extend([WORKING_DIR_AND_PYTHON_PATHS])

import django

print(f"Django {django.get_version()}")
if 'setup' in dir(django):
    django.setup()

import django_manage_shell

django_manage_shell.run(PROJECT_ROOT)

from django_extensions.management.shells import import_objects
from django.core.management.color import no_style

globals().update(
    import_objects({"dont_load": [], "quiet_load": False}, no_style())
)
```

# Sources #

https://gist.github.com/codeinthehole/7892be95ad152b621f3b62a6a3df0fc9
