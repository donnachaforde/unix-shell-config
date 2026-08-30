#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
#--------------------------------------------------------------------------

echo "Loading Maven configuration from .bashrc.config/maven.bashrc"


#--------------------------------------------------------------------------
# Maven environment

# opts
if test "$MVN_OPTS" = ""
then
	MVN_OPTS=; export MVN_OPTS
fi

if [ -d $OPT_HOME/maven ]; then

	# home
	MVN_HOME=$OPT_HOME/maven; export MVN_HOME
	M2_HOME=$MVN_HOME; export M2_HOME
	M2_REPO=${M2_REPO:-$HOME/.m2/repository}; export M2_REPO

	# path
	PATH=$PATH:$MVN_HOME/bin; export PATH

	# libs
	LIBPATH=$LIBPATH:$MVN_HOME/lib; export LIBPATH

	# man
	MANPATH=$MANPATH:$MVN_HOME/man; export MANPATH
fi

# On macOS, brew symlinks mvn straight onto the path, but resolving MVN_HOME/
# M2_HOME explicitly still helps tooling that expects them to be set
if test "$OS" = "Darwin"
then
	if [ -d $BREW_HOME/opt/maven ]; then
		MVN_HOME=$BREW_HOME/opt/maven; export MVN_HOME
		M2_HOME=$MVN_HOME; export M2_HOME
		M2_REPO=${M2_REPO:-$HOME/.m2/repository}; export M2_REPO
	fi
fi


#--------------------------------------------------------------------------
# aliases

alias mci='mvn clean install'
alias mvd='mvn dependency:tree'
alias mvp='mvn package'
alias mvr='mvn spring-boot:run'
