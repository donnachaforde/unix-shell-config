#--------------------------------------------------------------------------
#
# .bashrc - Bash Shell environment settings
#
#
# Developed by Donnacha Forde (donnacha.forde@gmail.com)
#
# Copyright © 2001 - 2022 Donnacha Forde. All rights reserved.
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

# cater for macOS
if test "$OS" = "Darwin"
then
	WHOAMI=${WHOAMI:-`/usr/bin/whoami`}
fi


#--------------------------------------------------------------------------
# home settings
#

# On Windows, tending to work in a separate directory on the root drive (i.e. not in C:\Users\<username>)
if test "$OS" = "Windows_NT"
then
	OPT_HOME=/c/views/opt; export OPT_HOME
else
	OPT_HOME=/opt; export OPT_HOME
fi


#--------------------------------------------------------------------------
# display details of the current host
#

echo "Logged on as "$USERID" on "$HOSTNAME" running "$OS" on "$MACHINE""
echo


#
# show the OS type in a banner
#
# Note: 'banner' cmd on macOS displays on its side so favour 'figlet'
#

if test "$OS" = "Darwin"
then
	if test -f /usr/local/bin/figlet
	then
		/usr/local/bin/figlet macOS
	fi
else
	if test -f /usr/bin/banner
	then
		banner $OS
	else
		# if cygwin is installed and the optional banner command is present, we can invoke that banner exe (even from Git-Bash)
		if test -d $OPT_HOME/cygwin64
		then
			if test -f $OPT_HOME/cygwin64/bin/banner
			then
				$OPT_HOME/cygwin64/bin/banner Windows
			fi
		fi
	fi
fi




#--------------------------------------------------------------------------
# prompt & window title
#

# Different bash implementations have different setting syntax so we adjust by platform, etc.
#
# - cygwin is not an xterm so it doesn't support 'title' 
#
# - AIX bash does not support the syntax used on SunOS and HP-UX
#   (setting title & prompt settings creates duplicate prompt)
#
# - The default is plain text = userid@host ~$ 
#

# Git Bash prompt on Windows is good enough so only uncomment block below if really necessary

# start with simple prompt
if test "$OS" != "Windows_NT"
then
	PS1="\u@\h \w$ "	
fi

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
#

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
#

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

	# add cmake tools
	PATH=$PATH:/c/Program\ Files/CMake/bin
	export PATH

	# add other unix binaries to the cmd line (sourced from msys/mingw)
	PATH=$PATH:$OPT_HOME/msys64/usr/bin:$OPT_HOME/msys64/mingw64/bin
	export PATH	

	# add PERL location for MinGW
	PATH=$PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
	export PATH	

	# gRPC - installed from build
	PATH=$PATH:$OPT_HOME/grpc/bin
	export PATH		

	# cygwin - we can optional add extra paths to cygwin executables (but may require some care...)
	CYGWIN_HOME=$OPT_HOME/cygwin64
	export CYGWIN_HOME
	#PATH=$PATH:$CYGWIN_HOME/bin:$CYGWIN_HOME/sbin:$CYGWIN_HOME/usr:$CYGWIN_HOME:/usr/sbin
	#export PATH

	# add go-lang
	PATH=$PATH:/c/Program\ Files/Go/bin
	export PATH


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
	GIT_HOME=/c/Program\ Files/Git
	export GIT_HOME

	PATH=$PATH:$GIT_HOME/bin:$GIT_HOME/cmd:$GIT_HOME/usr/bin
	export PATH
fi

# prefer to use OpenSSH on Windows (we can run as Windows Service)
if test "$OS" = "Windows_NT"
then
	GIT_SSH=$OPENSSH_HOME/ssh.exe	
	export GIT_SSH
fi


#--------------------------------------------------------------------------
# Java environment
#

# some variation with how local drives are reference between Cygwin, MinGW
if test "$OS" = "Windows_NT"
then
	# default on MinGW
	JDK_HOME=$OPT_HOME/AdoptJDK-11.0.13.8; export JDK_HOME

	# augment if on Cygwin
	if test "$MACHINE" = "Cygwin"
	then
		JDK_HOME=/cygdrive/$JDK_HOME
	fi
else 
	# assume UNIX/Linux-like environment
	JDK_HOME=/opt/java; export JDK_HOME	

	# cater for macOS
	if test "$OS" = "Darwin"
	then
		JDK_HOME=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home; export JDK_HOME
	fi

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
# Maven 
#

# ensure mvn is on the path on Windows
if test "$OS" = "Windows_NT"
then
	MVN_HOME=$OPT_HOME/apache-maven-3.8.4; export MVN_HOME
	PATH=$PATH:$MVN_HOME/bin
	export PATH

	# define MVN_OPTS
	if test "$MVN_OPTS" = ""
	then
		MVN_OPTS=; export MVN_OPTS
	fi
fi


#--------------------------------------------------------------------------
# gRPC 
#

GRPC_HOME=/opt/grpc
# cater for macOS
if test "$OS" = "Darwin"
then
	GRPC_HOME=~/.local
fi

if test "$OS" = "Windows_NT"
then
	GRPC_HOME=/c/views/opt/grpc
fi

export GRPC_HOME; 
PATH=$PATH:$GRPC_HOME/bin



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