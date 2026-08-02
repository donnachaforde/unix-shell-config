#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
#--------------------------------------------------------------------------

echo "Loading Java configuration from .bashrc.config/java.bashrc"


#--------------------------------------------------------------------------
# Java environment

if [ -d $OPT_HOME/java ]; then	

	# home
	JAVA_HOME=$OPT_HOME/java; export JAVA_HOME
	JRE_HOME=$JAVA_HOME; export JRE_HOME

	# add any extra optional settings
	if test "$JAVA_OPTS" = ""
	then
		JAVA_OPTS=; export JAVA_OPTS
	fi

	# add general classpath settings
	if test "$CLASSPATH" = ""
	then
		CLASSPATH=; export CLASSPATH
	fi


	# path
	PATH=$PATH:$JAVA_HOME/bin; export PATH

	# libs
	LIBPATH=$LIBPATH:$JAVA_HOME/lib; export LIBPATH

	# man
	MANPATH=$MANPATH:$JAVA_HOME/man; export MANPATH
fi

