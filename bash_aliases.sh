#--------------------------------------------------------------------------------
#
# Personal ~/.bash_aliases file for bash 4.1 (or later)
# 
# This file is read (normally) by interactive shells only. 
# See ~/.bashrc and ~/.bash_aliases for bash customizations and 
# aliases definitions.
#
# This file was originally written for GNU/Linux system
# but can be used on OS that uses bash as underlying shell like OSX.
#
# Author : Nataraj Basappa <n5j.b5a@yahoo.com>
# Created : 15th October 2010
# Last modified: 8th August 2018
#
#--------------------------------------------------------------------------------

if [[ $OPERATING_SYSTEM == 'Linux' ]] ; then
	alias ls="ls --color=auto"
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
elif [[ $OPERATING_SYSTEM == 'OSX' ]] ; then
	alias ls="ls -G"
fi

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'