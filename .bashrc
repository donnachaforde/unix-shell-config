#--------------------------------------------------------------------------
#
# .bashrc - Bash Shell environment settings
#
#
# Developed by Donnacha Forde (donnacha.forde@gmail.com)
#
# Copyright © 2001 - 2020 Donnacha Forde. All rights reserved.
#
# This software is provided 'as is' without warranty, expressed or implied.
# Donnacha Forde accepts no responsibility for its use or reliability.
#
#--------------------------------------------------------------------------

echo
echo "Bash Shell"
echo "Personal settings loaded from ~/.bashrc"
echo


#--------------------------------------------------------------------------
# determine platform, user and hostname and type of machine/environment
#

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

# cater for MacOS
if test "$OS" = "Darwin"
then
	WHOAMI=${WHOAMI:-`/usr/bin/whoami`}
fi


echo "Logged on as "$USERID" on "$HOSTNAME" running "$OS" on "$MACHINE""
echo

# show the OS type in a banner if the cmd is available (skip for mac as is sideways)
if test -f /usr/bin/banner
then
	if test "$OS" != "Darwin"
	then
		banner $OS
	fi
fi


#--------------------------------------------------------------------------
# prompt & window title
#

# Different bash implementations have different setting syntax
#
# cygwin is not an xterm so it doesn't support 'title' 
#
# AIX bash does not support the syntax used on SunOS and HP-UX
# (setting title & prompt settings creates duplicate prompt)
#
# The default is plain text = userid@host ~$ 
#

# start with simple prompt
PS1="\u@\h \w$ "	

# next we change it according to platform (i.e. add colour and title)
if test "$OS" = "Windows_NT"
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
#

# console colours - CygWin
if test "$OS" = "Windows_NT"
then
	eval `dircolors -b /etc/DIR_COLORS`
	alias ls='ls --color=auto'		# must alias ls to see the colours
fi


#--------------------------------------------------------------------------
# path settings
#

# binaries
PATH=.:~/bin/$OS:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/ucb:/usr/ccs/bin:/usr/dt/bin:/usr/proc/bin
export PATH


# library path (Note:  The environment variable is different on Solaris.)
if test "$OS" = "SunOS"
then
	LD_LIBRARY_PATH=.:/lib:/usr/lib:/usr/local/lib:/usr/ccs/lib:/usr/ucblib
	export LD_LIBRARY_PATH
else
	LIBPATH=.:/lib:/usr/lib:/usr/local/lib:/usr/ccs/lib:/usr/ucblib
	export LIBPATH
fi

# man path 
MANPATH=/usr/local/man:/usr/share/man:/usr/openwin/man:/usr/dt/man
export MANPATH

# additional path on Solaris
if test "$OS" = "SunOS"
then
	MANPATH=$MANPATH:/opt/SUNWspro/man
	export MANPATH
fi


# X binaries (usually elsewhere on Solaris)
if test "$OS" = "SunOS"
then
	PATH=$PATH:/usr/X/bin:/usr/X/sbin
fi

if test "$OS" = "HP-UX"
then
	PATH=$PATH:/usr/X11/bin:/usr/X11/sbin
else
	PATH=$PATH:/usr/X11R6/bin:/usr/X11R6/sbin
fi
export PATH


#--------------------------------------------------------------------------
# Java environment
#

# some variation with how local drives are reference between Cygwin, MinGW
if test "$OS" = "Windows_NT"
then
	# default on MinGW
	JDK_HOME=/c/views/opt/jdk-14.0.1; export JDK_HOME

	# augment if on Cygwin
	if test "$MACHINE" = "Cygwin"
	then
		JDK_HOME=/cygdrive/$JDK_HOME
	fi
else 
	# Linux, MacOS plus Unix (AIX, HP-UX, Solaris)
	JDK_HOME=/opt/java; export JDK_HOME
fi
JAVA_HOME=$JDK_HOME; export JAVA_HOME


# add java to the path
PATH=$PATH:$JAVA_HOME/bin
export PATH


if test "$JAVA_OPTS" = ""
then
	JAVA_OPTS=; export JAVA_OPTS
fi

if test "$CLASSPATH" = ""
then
	CLASSPATH=; export CLASSPATH
fi


#--------------------------------------------------------------------------
# source X display

if test -f ~/.bashrc.display
then
	. ~/.bashrc.display
fi

#--------------------------------------------------------------------------
# source aliases

if test -f ~/.bashrc.alias
then
	. ~/.bashrc.alias
fi
echo


#--------------------------------------------------------------------------
# display shell version 
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


#--------------------------------------------------------------------------
# display date & time 
#

date
echo
