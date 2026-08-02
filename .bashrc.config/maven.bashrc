#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
#--------------------------------------------------------------------------

echo "Loading Maven configuration from .bashrc.config/maven.bashrc"


#--------------------------------------------------------------------------
# Maven environment

# Note: On macOS, brew installs mvn into brew path
if [ -d $OPT_HOME/maven ]; then

	# home
	MVN_HOME=$OPT_HOME/maven; export MVN_HOME
	M2_HOME=$MVN_HOME; export M2_HOME
	M2_REPO=${M2_REPO:-$HOME/.m2/repository}; export M2_REPO

	# opts
	if test "$MVN_OPTS" = ""
	then
		MVN_OPTS=; export MVN_OPTS
	fi

	# path
	PATH=$PATH:$MVN_HOME/bin; export PATH

	# libs
	LIBPATH=$LIBPATH:$MVN_HOME/lib; export LIBPATH

	# man
	MANPATH=$MANPATH:$MVN_HOME/man; export MANPATH
fi


#--------------------------------------------------------------------------
# aliases

alias mci='mvn clean install'
alias mvd='mvn dependency:tree'
alias mvp='mvn package'
alias mvr='mvn spring-boot:run'
