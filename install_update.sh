#!/usr/bin/env bash
#------------------------------------------------------------------------------
#
# This is a install & update file to setup bash settings on new machine.
# Checkout into the home folder and call ./install_update.sh to setup or 
# upgrade.
#
# Changes this script does
# - Installs homebrew, if not installed
# - Installs oh-my-bash, if not installed
# - Upgrade bash to v4
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
# Last modified: 9th August 2018
#
#------------------------------------------------------------------------------

# Install homebrew, if its OSX
if [[ $OSTYPE == "darwin"* ]]; then
  # homebrew
  which -s brew
  if [ $? != 0 ]; then
	  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else  
    brew update 
  fi
  
  # upgrade bash on mac
  bash_major_version=$(echo $BASH_VERSION | cut -d '.' -f 1)
  if [ ${bash_major_version} -lt 4 ]; then
    brew install bash
    
    # Add the new shell to the list of allowed shells
    sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
    
    # Change to the new shell
    chsh -s /usr/local/bin/bash 
  fi
  unset bash_major_version
fi

# Install oh-my-bash
if [ -z $OSH ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi

# custom aliases - all env
if [ -f bash_aliases.sh ]; then
  cp bash_aliases.sh $OSH/custom/aliases
fi

# custom exports - all env
if [ -f bash_exports.sh ]; then
  cp bash_exports.sh $OSH/custom/
fi

# custom exports - local box
if [ -f bash_localised.sh ]; then
  cp bash_localised.sh $OSH/custom/
fi

# gitconfig
if [ -f gitconfig ]; then
  cp gitconfig $HOME/.gitconfig
fi

# ssh config
if [ -f config ]; then
  if [ ! -d $HOME/.ssh ]; then
    mkdir $HOME/.ssh
    chmod 700 $HOME/.ssh
  fi  
  cp config $HOME/.ssh/config
fi

# code and tools folder
if [ ! -d $HOME/Code ]; then
  mkdir -p $HOME/Code/tools/
fi

source $HOME/.bashrc

[ $? == 0 ] && printf "SUCCESS\n" || printf "FAILED!\n"