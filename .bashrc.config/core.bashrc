# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde

echo "Loading core shell settings from .bashrc.config/core.bashrc"


#--------------------------------------------------------------------------
# display host details

OS=${OS:-`uname`}
HOSTNAME=${HOSTNAME:-`hostname`}
USERID=${USERID:-`logname`}
WHOAMI=${WHOAMI:-`whoami`}

UNAME="$(uname -s)"
case "${UNAME}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${UNAME}"
esac

# whoami command located in different places across OS
if test "$OS" = "Windows_NT"
then
	WHOAMI=${WHOAMI:-`/bin/whoami`}
fi

if test "$OS" = "SunOS"
then
	WHOAMI=${WHOAMI:-`/usr/ucb/whoami`}
fi

if test "$OS" = "AIX"
then
	WHOAMI=${WHOAMI:-`/usr/ucb/whoami`}
fi

if test "$OS" = "HP-UX"
then
	WHOAMI=${WHOAMI:-`/usr/ucb/whoami`}
fi

# cater for macOS
if test "$OS" = "Darwin"
then
	WHOAMI=${WHOAMI:-`/usr/bin/whoami`}
fi


#--------------------------------------------------------------------------
# home settings

# On Windows, tending to work in a separate directory on the root drive (i.e. not in C:\Users\<username>)
if test "$OS" = "Windows_NT"
then
	OPT_HOME=/d/opt; export OPT_HOME
else
	OPT_HOME=/opt; export OPT_HOME
fi


#--------------------------------------------------------------------------
# terminal history settings - ensure we have a large history
#
# Note: on Windows, Git Bash defaults to 500 so we increase it here
# Note: on macOS, the default is 5000 so we increase it here
# Note: on Linux, the default is 1000 so we increase it here

export HISTSIZE=10000
export HISTFILESIZE=20000


#--------------------------------------------------------------------------
# path settings

# add common UNIX/Linux paths 
PATH=.:~/bin/$OS:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/ucb:/usr/ccs/bin:/usr/dt/bin:/usr/proc/bin
export PATH

# add extra paths for Windows
if test "$OS" = "Windows_NT"
then
	# additional windows commands
	PATH=$PATH:/c/Windows:/c/Windows/system32
	export PATH

	# sysinternal commands
	SYSINTERNALS_HOME=$OPT_HOME/sysinternalssuite; export SYSINTERNALS_HOME
	PATH=$PATH:$SYSINTERNALS_HOME
	export PATH

	# launch VS Code from command line
	VSCODE_HOME=~/AppData/Local/Programs/Microsoft\ VS\ Code/bin; export VSCODE_HOME
	PATH=$PATH:$VSCODE_HOME
	export PATH
fi

# Configure paths for macOS
if test "$OS" = "Darwin"
then
	# suppress "the default interactive shell is now zsh" warning on every bash startup
	export BASH_SILENCE_DEPRECATION_WARNING=1

	# give preference to 'brew' commands
	BREW_HOME=/opt/homebrew; export BREW_HOME
	PATH=./:$BREW_HOME/bin:$PATH; export PATH

	# ensure we can launch VS Code from command line
	if [ -d /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin ]; then
		VSCODE_HOME=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin; export VSCODE_HOME
		PATH=$PATH:$VSCODE_HOME; export PATH
	fi

	# include access to our own scripts
	PATH=$PATH:~/views/scripts; export PATH
fi


#--------------------------------------------------------------------------
# library path 

LIBPATH=.:/lib:/usr/lib:/usr/local/lib:/usr/ccs/lib:/usr/ucblib
export LIBPATH

# library environment variable is different on Solaris.
if test "$OS" = "SunOS"
then
	LD_LIBRARY_PATH=$LIBPATH 
	export LD_LIBRARY_PATH
fi


#--------------------------------------------------------------------------
# man path 

MANPATH=/usr/local/man:/usr/share/man:/usr/openwin/man:/usr/dt/man
export MANPATH

# additional path on Solaris
if test "$OS" = "SunOS"
then
	MANPATH=$MANPATH:/opt/SUNWspro/man; export MANPATH
fi
