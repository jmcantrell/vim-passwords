cwd := $(shell pwd)
user := $(shell whoami)
host := $(shell hostname)
name := $(notdir $(cwd))

all: dev help

dev:
	mkdir -p ~/.vim/bundle
	ln -sfn $(cwd) ~/.vim/bundle/$(name)

undev:
	rm -f ~/.vim/bundle/$(name)

help:
	vim -c 'helptags doc' -c q

clean:
	find . -type f -name tags -delete
