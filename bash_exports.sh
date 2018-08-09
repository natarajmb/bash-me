#------------------------------------------------------------------------------
#
# Personal ~/.bash_exports file for bash 4.1 (or later)
#
# This file is read (normally) by interactive shells only.
# See ~/.bash_profile and ~/.bash_aliases for bash customisations and
# aliases definitions.
#
# This file was originally written for GNU/Linux system
# but can be used on OS that uses bash as underlying shell like OSX.
#
# Author : Nataraj Basappa <n5j.b5a@gmail.com>
# Created : 15th October 2010
# Last modified: 9th August 2018
#
#------------------------------------------------------------------------------

# Development home, everything to do with programming
export DEV_HOME=~/Code

# Java Home
if [[ $OSTYPE == "linux-gnu"  ]] ; then
    export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
elif [[ $OSTYPE == "darwin"* ]] ; then
	export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Speeds up maven compile
export MAVEN_OPTS=-Xmx512m

# Adding maven debug options
export MAVEN_OPTS="$MAVEN_OPTS -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=181016,server=y,suspend=n"