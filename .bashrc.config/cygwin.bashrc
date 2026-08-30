# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde

echo "Loading Cygwin configuration from .bashrc.config/cygwin.bashrc"


#--------------------------------------------------------------------------
# console colours - extra step needed for Cygwin (Git Bash's default is good enough)

if test "$MACHINE" = "Cygwin"
then
	eval `dircolors -b /etc/DIR_COLORS`
fi


#--------------------------------------------------------------------------
# Cygwin home and optional executable paths

if test "$OS" = "Windows_NT"
then
	CYGWIN_HOME=$OPT_HOME/cygwin64
	export CYGWIN_HOME

	# uncomment to put Cygwin's own executables on PATH (may require some care alongside Git Bash's)
	#PATH=$PATH:$CYGWIN_HOME/bin:$CYGWIN_HOME/sbin:$CYGWIN_HOME/usr:$CYGWIN_HOME:/usr/sbin
	#export PATH
fi
