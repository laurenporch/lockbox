#!/bin/bash

alias ls='ls --color'
alias ll='ls -l'
alias la='ll -a'
alias fixtmout='gdb -ex '\''call (int) unbind_variable("TMOUT")'\'' --pid=882929 --batch > /dev/null 2>&1'
