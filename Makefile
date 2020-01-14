SHELL := /bin/bash

# Installation
.PHONY: build install

build:
	. osx_build.sh

install:
	cp -R dotfiles/ $(HOME)
