#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
#--------------------------------------------------------------------------

BASHRC_LOADED="$BASHRC_LOADED java"


#--------------------------------------------------------------------------
# Java environment

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

if [ -d $OPT_HOME/java ]; then

	# home
	JAVA_HOME=$OPT_HOME/java; export JAVA_HOME
	JRE_HOME=$JAVA_HOME; export JRE_HOME

	# path
	PATH=$PATH:$JAVA_HOME/bin; export PATH

	# libs
	LIBPATH=$LIBPATH:$JAVA_HOME/lib; export LIBPATH

	# man
	MANPATH=$MANPATH:$JAVA_HOME/man; export MANPATH
fi

# On macOS, Homebrew's openjdk formulas are keg-only (not symlinked into
# BREW_HOME), so resolve JAVA_HOME to the real JDK bundle location
if test "$OS" = "Darwin"
then
	if [ -d $BREW_HOME/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home ]; then
		JAVA_HOME=$BREW_HOME/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home; export JAVA_HOME
		JRE_HOME=$JAVA_HOME; export JRE_HOME
		PATH=$PATH:$JAVA_HOME/bin; export PATH
	fi
fi

