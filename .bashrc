#--------------------------------------------------------------------------
#
# .bashrc - Bash Shell environment settings
#
# Copyright © 2001 - 2024 Donnacha Forde. All rights reserved.
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
	OPT_HOME=/c/views/opt; export OPT_HOME
else
	OPT_HOME=/opt; export OPT_HOME
fi


#--------------------------------------------------------------------------
# display details of the current host

echo "Logged on as "$USERID" on "$HOSTNAME" running "$OS" on "$MACHINE""
echo

# show the OS type in a banner
if test "$OS" = "Darwin"
then
	if test -f /usr/local/bin/figlet
	then
		# 'banner' cmd on macOS displays on its side so favour 'figlet'
		/usr/local/bin/figlet macOS
	fi
else
	if test -f /usr/bin/banner
	then
		banner $OS
	else
		# on windows, we can use the optional cygwin banner.exe command, even from GitBash
		if test -f $OPT_HOME/cygwin64/bin/banner
		then
			$OPT_HOME/cygwin64/bin/banner Windows
		fi
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

# OpenSSH env
if test "$OS" = "Windows_NT"
then
	OPENSSH_HOME=/c/Windows/System32/OpenSSH
	export OPENSSH_HOME
fi

# add common UNIX/Linux paths 
if test "$OS" = "Windows_NT"
then
	# show precedence to OpenSSH
	PATH=.:$OPENSSH_HOME:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/ucb:/usr/ccs/bin:/usr/dt/bin:/usr/proc/bin
	export PATH
else
	PATH=.:~/bin/$OS:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/ucb:/usr/ccs/bin:/usr/dt/bin:/usr/proc/bin
	export PATH
fi

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

	# launch vs code from command line
	PATH=$PATH:~/AppData/Local/Programs/Microsoft\ VS\ Code/bin
	export PATH

	# add VS dev VS tools (like dumpbin.exe) 
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

#--------------------------------------------------------------------------
# library path 
#

# Note: The library environment variable is different on Solaris.
if test "$OS" = "SunOS"
then
	LD_LIBRARY_PATH=.:/lib:/usr/lib:/usr/local/lib:/usr/ccs/lib:/usr/ucblib
	export LD_LIBRARY_PATH
else
	LIBPATH=.:/lib:/usr/lib:/usr/local/lib:/usr/ccs/lib:/usr/ucblib
	export LIBPATH
fi


#--------------------------------------------------------------------------
# man path 
#

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
# Git environment
#

# ensure paths to git executables are available
if test "$OS" = "Windows_NT"
then
	GIT_HOME=/c/Program\ Files/Git; export GIT_HOME
fi

# prefer to use OpenSSH on Windows (we can run as Windows Service)
if test "$OS" = "Windows_NT"
then
	GIT_SSH=$OPENSSH_HOME/ssh.exe; 	export GIT_SSH
fi


if test -f $GIT_HOME

	# home
	GIT_HOME=$OPT_HOME/maven; export GIT_HOME

	# path
	PATH=$PATH::$GIT_HOME/bin:$GIT_HOME/cmd:$GIT_HOME/usr/bin; export PATH

	# libs
	LIBPATH=$LIBPATH:$GIT_HOME/lib; export LIBPATH

	# man
	MANPATH=$MANPATH:$GIT_HOME/man; export MANPATH

	# alias

fi



#--------------------------------------------------------------------------
# Java 

if test -f $OPT_HOME/java
	
	# home
	JAVA_HOME=$OPT_HOME/maven; export JAVA_HOME

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

	# alias
	# N/A

fi



#--------------------------------------------------------------------------
# Maven 

if test -f $OPT_HOME/maven

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

	# alias
	alias mci maven clean install

fi


#--------------------------------------------------------------------------
# gRPC 

if test -f $OPT_HOME/grpc

	# home
	GRPC_HOME=$OPT_HOME/grpc; export GRPC_HOME

	# path
	PATH=$PATH:$GRPC_HOME/bin; export PATH

	# libs
	LIBPATH=$LIBPATH:$GRPC_HOME/lib; export LIBPATH

	# man
	MANPATH=$MANPATH:$GRPC_HOME/man; export MANPATH

	# alias

fi



#--------------------------------------------------------------------------
# CMake

if test -f $OPT_HOME/CMake

	# home
	CMAKE_HOME=$OPT_HOME/CMake; export CMAKE_HOME

	# path
	PATH=$PATH:$CMAKE_HOME/bin; export PATH

	# lib path 
	# N/A

	# man
	# N/A

	# alias
	alias cm cmake

fi


#--------------------------------------------------------------------------
# Golang

if test -f $OPT_HOME/Go

	# home
	GOLANG_HOME=$OPT_HOME/Go; export GOLANG_HOME

	# path
	PATH=$PATH:$GOLANG_HOME/bin; export PATH

	# lib path - N/A

	# man - N/A

	# alias

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