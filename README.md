# Global Mac Setup

## Mac configuration

### Show hidden files
Launch terminal and run:

    $ defaults write com.apple.finder AppleShowAllFiles YES; killall Finder

And add file configurations to `$HOME`:

    $ cp -r ./deploy/ $HOME

### SSH keys
Either generate key pair `id_rsa` / `id_rsa.pub` via ssh agent:

    $ ssh-keygen -t rsa -b 4096 -C "label"
    $ eval "$(ssh-agent -s)"
    $ ssh-add -K ~/.ssh/id_rsa

Or copy over existing keys:

	$ chmod 400 id_rsa
	$ chmod 400 id_rsa.pub

## Package manager

### Install [Homebrew](http://brew.sh/#install/)
Launch terminal and execute:
	
	$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

In `$PATH`, make sure `/usr/local/bin` is before `/usr/bin`:

```sh
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
```

### Library dependencies

    $ brew update
    $ brew upgrade
    $ brew install coreutils wget git

## Custom shell

### Install [Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
Install via Homebrew,

    $ brew install zsh zsh-completions

Add into allowed shells and make `zsh` as defaut:

    $ sudo echo $(which zsh) > /etc/shells
    $ chsh -s $(which zsh)

To switch back to `bash`,

    $ chsh -s $(which bash)

### Install [Oh-My-Zsh](http://ohmyz.sh)
Launch terminal and execute:

    $ sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


## Python2 / Python3

### Install C compilers
Either `gcc` with Homebrew:

    $ brew install gcc

Or `xcode` command line tools:

    $ xcode-select --install

Or lastly [Xcode](https://developer.apple.com/xcode/) app from the Apple store.

### Install Python
Use Homebrew to install `Python2`:

	$ brew install python

To [override MacOS](https://docs.brew.sh/Homebrew-and-Python.html) Python exec,
append `$PATH` such as:

```sh
export PATH=/usr/local/opt/python/libexec/bin:$PATH
```

Use Homebrew to install `Python3`:

	$ brew install python3

### Install Pip and Virtualenv
Force update `pip` to latest version:

    $ python3 -m pip3 install -U --force-reinstall pip
    $ python2 -m pip2 install -U --force-reinstall pip

Now install `virtualenv` and `virtualenvwrapper` globally:

	$ pip2 install -U virtualenv virtualenvwrapper
	$ pip3 install -U virtualenv virtualenvwrapper
	$ makedir -p $HOME/.pyenv

### Install [Pyenv](https://github.com/pyenv/pyenv-virtualenvwrapper)
To get Pyenv installed:

	$ brew install pyenv pyenv-virtualenvwrapper

And make sure to add the following into your `~/.zshrc` or `~/.bash_profile`:

```sh
# Pyenv
eval "$(pyenv init -)"
# Virtualenvwrapper
export WORKON_HOME=$HOME/.pyenv
# Via pyenv-virtualenvwrapper
eval "pyenv virtualenvwrapper"
```

## Ruby

### Install [Rbenv](https://github.com/rbenv/rbenv)
To get Rbenv installed:

    $ brew install rbenv

And make sure to add the following into your `~/.zshrc` or `~/.bash_profile`:

```sh
# Rbenv
eval "$(rbenv init -)"
```

## Databases

### PostgreSQL specificities
Install [PostgreSQL](https://www.postgresql.org/download/macosx) via the MAC installer.

And add its executables to the `$PATH` by adding the following to your `~/.bash_profile`:

```sh
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
```


# Lastly... cheatsheet!

### Autoreload iPython shell
Install iPython and create a config file,

    $ ipython profile create

Then edit `~/.config/ipython/profile_default/ipython_config.py` and add,

```python
c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = ['%autoreload 2']
c.InteractiveShellApp.exec_lines.append(
    'print("Warning: disable autoreload to improve performance.")'
)
```

### Django Shell_plus extension into PyCharm
Enable Django support in Languages & Frameworks > Django,

Then add the the following starting script in Build, Execution, Deployment > Django Console,

```python
import sys; print('Python %s on %s' % (sys.version, sys.platform))
import django; print('Django %s' % django.get_version())
sys.path.extend([WORKING_DIR_AND_PYTHON_PATHS])
if 'setup' in dir(django): django.setup()
import django_manage_shell; django_manage_shell.run(PROJECT_ROOT)
from django_extensions.management.shells import import_objects
from django.core.management.color import no_style
globals().update(import_objects({"dont_load":[], "quiet_load":False},no_style()))
```
