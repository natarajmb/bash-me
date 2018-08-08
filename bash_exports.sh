#--------------------------------------------------------------------------------
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
# Last modified: 8th August 2018
#
#--------------------------------------------------------------------------------

# Development home, everything to do with programming
export DEV_HOME=~/Code

# Refers to development tools
export TOOLS=$DEV_HOME/tools

# Java Home and workspace
if [[ $OPERATING_SYSTEM == 'Linux' ]] ; then
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
elif [[ $OPERATING_SYSTEM == 'OSX' ]] ; then
	export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Ant home
export ANT_HOME=$TOOLS/ant

# Maven Home
export M2_HOME=$TOOLS/maven

# Speeds up maven compile
export MAVEN_OPTS=-Xmx512m

# Adding maven debug options
export MAVEN_OPTS="$MAVEN_OPTS -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=181016,server=y,suspend=n"

# Gradle Home
export GRADLE_HOME=$TOOLS/gradle

# Update paths
export PATH=$PATH:$ANT_HOME/bin:$M2_HOME/bin:$JAVA_HOME/bin:$GRADLE_HOME/bin: