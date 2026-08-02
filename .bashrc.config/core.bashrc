#--------------------------------------------------------------------------
#
# core.bashrc - Core bash shell environment settings
#
# Copyright © 2001 - 2025 Donnacha Forde. All rights reserved.
#
# This software is provided 'as is' without warranty, expressed or implied.
# Donnacha Forde accepts no responsibility for its use or reliability.
#
#--------------------------------------------------------------------------

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
# display details of the current host

echo "Logged on as "$USERID" on "$HOSTNAME" running "$OS" on "$MACHINE""
echo

# show the OS type in a banner
if test "$OS" = "Windows_NT"
then
	# use cygwin banner.exe command, even from GitBash
	if test -f $OPT_HOME/cygwin64/bin/banner
	then
		$OPT_HOME/cygwin64/bin/banner Windows
	fi
fi

if test "$OS" = "Darwin"
then
	# 'banner' cmd on macOS displays on its side so favour 'figlet' ( '$ brew install figlet'
	if test -f /opt/homebrew/bin/figlet
	then
		/opt/homebrew/bin/figlet macOS
	fi
fi

if test "$OS" = "Linux" 
then
	if test -f /usr/bin/banner
	then
		banner $OS
	fi
fi


#--------------------------------------------------------------------------
# prompt & window title

# Different bash implementations have different setting syntax so we adjust by platform, etc.
#
# - cygwin is not an xterm so it doesn't support 'title' 
#
# - AIX bash does not support the syntax used on SunOS and HP-UX
#   (setting title & prompt settings creates duplicate prompt)
#
# - The default is plain text = userid@host ~$ 
#

# start with simple prompt
if test "$OS" != "Windows_NT"
then
	PS1="\u@\h \w$ "	
fi

# Git Bash prompt on Windows is good enough so only uncomment block below if really necessary
# if test "$OS" = "Windows_NT"
# then
# 	PS1='\[\033]1;\w\007\033[32m\033[33m\w\033[0m\]$ '
# fi

if test "$MACHINE" = "Cygwin"
then
 	PS1='\[\033]1;\w\007\033[32m\033[33m\w\033[0m\]$ '
fi

if test "$OS" = "AIX"			
then
	PS1="\[\e]2;\u@\h\a\]\w$ "
fi

if test "$OS" = "HP-UX"
then
	PS1="\[\e]2;\u@\h\a\e[34;1m\u \e[32;1m\w$ \e[0m\]"
fi

if test "$OS" = "SunOS"
then
	# show "root" in red when logged in as root
	if test "$WHOAMI" = "root"
	then
		PS1="\[\e]2;\u@\h\a\e[31;1m\u \e[32;1m\w# \e[0m\]"
	else
		PS1="\[\e]2;\u@\h\a\e[34;1m\u \e[32;1m\w$ \e[0m\]"
	fi	
fi


#--------------------------------------------------------------------------
# environment settings

# console colours - extra step needed for CygWin but Git Bash default is good enough

# augment if on Cygwin
if test "$MACHINE" = "Cygwin"
then
	eval `dircolors -b /etc/DIR_COLORS`
fi

if test "$OS" = "Windows_NT"
then
	# alias 'ls' to ensure we see the colours	
	alias ls='ls --color=auto'		
fi


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
	PATH=$PATH:$OPT_HOME/sysinternalssuite
	export PATH
	
	# ninja
	PATH=$PATH:$OPT_HOME/ninja
	export PATH
	
	# nasm
	PATH=$PATH:$OPT_HOME/nasm
	export PATH

	# launch VS Code from command line
	PATH=$PATH:~/AppData/Local/Programs/Microsoft\ VS\ Code/bin
	export PATH

	# add VS dev tools (like dumpbin.exe) 
	VS_HOME=/c/Program\ Files/Microsoft\ Visual\ Studio/2022/Professional
	export VS_HOME; 
	PATH=$PATH:$VS_HOME/Common7/IDE:$VS_HOME/VC/Tools/MSVC/14.31.31103/bin/Hostx64/x64
	export PATH	

	# add other unix binaries to the cmd line (sourced from msys/mingw)
	PATH=$PATH:$OPT_HOME/msys64/usr/bin:$OPT_HOME/msys64/mingw64/bin
	export PATH	

	# add PERL location for MinGW
	PATH=$PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
	export PATH	

	# cygwin - we can optional add extra paths to cygwin executables (but may require some care...)
	CYGWIN_HOME=$OPT_HOME/cygwin64
	export CYGWIN_HOME
	#PATH=$PATH:$CYGWIN_HOME/bin:$CYGWIN_HOME/sbin:$CYGWIN_HOME/usr:$CYGWIN_HOME:/usr/sbin
	#export PATH
fi

# Configure paths for macOS
if test "$OS" = "Darwin"
then
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


#--------------------------------------------------------------------------
# Display shell version, date & time
#

if test -f /bin/bash
then
	echo 
	/bin/bash --version
	echo
else 
	if test -f /usr/local/bin/bash
	then
		echo 
		/usr/local/bin/bash --version
		echo
	fi
fi

date
echo
