# Global Mac Setup

## Downloads

### Engineering
- [Sublime3](https://www.sublimetext.com/3)
- [PyCharm](https://www.jetbrains.com/toolbox/app)
- [Anaconda](https://www.continuum.io/downloads) (alternative with Pyenv)
- [MySQLWorkBench](https://dev.mysql.com/downloads/workbench)
- [pgAdmin](https://www.pgadmin.org/download)
- [Filezilla](https://filezilla-project.org/download.php?type=client)
- [Docker](https://docs.docker.com/docker-for-mac)
- [Postman](https://www.getpostman.com)

### Productivity
- [1Password](https://1password.com/downloads)
- [Slack](https://slack.com/downloads/osx)
- [Dropbox](https://www.dropbox.com/downloading)
- [TunnelBear](https://www.tunnelbear.com/download)
- [f.lux](https://justgetflux.com)
- [Chrome](https://www.google.com/chrome/browser/desktop/index.html)
with extensions: AdBlock, Ghostery, DuckDuckGo, JSONView, JetBrain, 1Password, Hunter

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

## Custom text editor

### Symlink [subl exec](http://www.sublimetext.com/docs/3/osx_command_line.html)
Launch terminal and run:

    $ ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

Make custom exec into `/usr/local/bin`:

    $ cp ./subl_wait /usr/local/bin/subl_wait
    $ chmod +x /usr/local/bin/subl_wait

### Install packages
- [PackageControl](https://packagecontrol.io/installation#st3)
- [Anaconda](http://damnwidget.github.io/anaconda)
- [Orgmode](https://packagecontrol.io/packages/orgmode)
- [Docker](https://packagecontrol.io/packages/Dockerfile%20Syntax%20Highlighting)

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

### Install [Pyenv]((https://github.com/pyenv/pyenv-virtualenvwrapper))
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

### Other dependencies for PyPi packages

	$ brew install qt4 pyqt zmq libyaml

## Databases

### MySQL specificities
Install MySQL via Homebrew:

	$ brew install mysql

And initialize the local MySQL server as well as an initial Db:

	$ unset TMPDIR
	$ mysqld -initialize --verbose --user=whoami --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
	
Add-hoc launch of MySQL server:

    $ mysql.server start

### PostgreSQL specificities
Install [PostgreSQL](https://www.postgresql.org/download/macosx) via the MAC installer.

And add its executables to the `$PATH` by adding the following to your `~/.bash_profile`:

```sh
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
```

Start Postgres and initialise through the GUI.

# Lastly... cheatsheet!

### Remove Homebrew packages
To remove a package and all of its dependencies recursively,

    $ brew tap ggpeti/rmrec
    $ brew rmrec <pkgname>

### Reset distribution packages
Reset Python distributions globally,

    $ pip install pip-tools
    $ pip-sync ./requirements.txt

### Create a virtualenv via Pyenv
Install Python3.6.1 distribution via Pyenv,

    $ pyenv install 3.6.1
    $ pyenv global 3.6.1
    $ pip install virtualenv virtualenvwrapper
    $ mkvirtualenvwrapper Test

Install Anaconda3 distribution via Pyenv,

    $ pyenv install anaconda3-5.0.0
    $ pyenv global anaconda3-5.0.0
    $ conda list

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
