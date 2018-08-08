#!/usr/bin/env bash
#--------------------------------------------------------------------------------
#
# This is a install file to setup bash settings on new machine.
# Checkout into the home folder and call ./install.sh to setup.
#
# Changes this script does
# - Installs homebrew
# - Installs oh-my-bash
# - Moves following files in $OSH/CUSTOM folder
#   - bash_exports
#   - bash_localised
# - Renames the file to dot
#   - gitconfig
# - Move config file into .ssh/config
# - Creates a symlink between .bashrc to .bash_profile (requied for mac)
# - removes .git to avoid wrongly pushing changes to repo
# - Deletes self
#
# This file was originally written for GNU/Linux system
# but can be used on OS that uses bash as underlying shell like OSX.
#
# Author : Nataraj Basappa <n5j.b5a@gmail.com>
# Created : 26th November 2016
# Last modified: 8th August 2018
#
#--------------------------------------------------------------------------------

# Install homebrew, if its OSX
if [[ $OPERATING_SYSTEM == 'OSX' ]] ; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install oh-my-bash
sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"

if [ -f bash_aliases.sh ]; then
  mv bash_aliases.sh $OSH/custom/aliases
fi

if [ -f bash_exports.sh ]; then
  mv bash_exports.sh $OSH/custom/
fi

if [ -f bash_localised.sh ]; then
  mv bash_localised.sh $OSH/custom/
fi

if [ -f gitconfig ]; then
  mv gitconfig .gitconfig
fi

if [ -f config ]; then
  if [ ! -d .ssh ]; then
    mkdir .ssh
    chmod 700 .ssh
  fi  
  mv config .ssh/config
fi

if [[ $OPERATING_SYSTEM == 'OSX' ]] ; then
  if [ -f .bash_profile ]; then
    rm .bash_profile
  fi
  ln -s .bashrc .bash_profile
fi

rm -rf .git
rm ./install.sh
