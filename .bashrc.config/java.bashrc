#--------------------------------------------------------------------------
#
# java.bashrc - Java and Maven configuration
#
# Copyright © 2001 - 2026 Donnacha Forde. All rights reserved.
#
# This software is provided 'as is' without warranty, expressed or implied.
# Donnacha Forde accepts no responsibility for its use or reliability.
#
#--------------------------------------------------------------------------

echo "Loading Java/Maven configuration from .bashrc.config/java.bashrc"


#--------------------------------------------------------------------------
# Java 

if [ -d $OPT_HOME/java ]; then	

	# home
	JAVA_HOME=$OPT_HOME/java; export JAVA_HOME

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



#--------------------------------------------------------------------------
# Maven 

# Note: On macOS, brew installs mvn into brew path
if [ -d $OPT_HOME/maven ]; then

	# home
	MVN_HOME=$OPT_HOME/maven; export MVN_HOME

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

# alias
alias mci='mvn clean install'
alias mvd='mvn dependency:tree'
alias mvp='mvn package'
alias mvr='mvn spring-boot:run'
