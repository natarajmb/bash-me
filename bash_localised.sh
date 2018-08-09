#------------------------------------------------------------------------------
#
# Personal ~/.bash_localised file for bash 4.1 (or later)
#
# This file is read (normally) by interactive shells only.
# See ~/.bash_exports and ~/.bash_aliases for exports and aliases
# definitions.
#
# This file was originally written for GNU/Linux system
# but can be used on OS that uses bash as underlying shell like OSX.
#
# Author : Nataraj Basappa <n5j.b5a@gmail.com>
# Created date: 7th December 2015
# Last modified: 9th August 2018
#
#------------------------------------------------------------------------------

# Homebrew path update required only for Mac
if [[ $OSTYPE == "darwin"* ]] ; then
   export PATH=$PATH:/opt/local/bin:/opt/local/sbin:
fi
