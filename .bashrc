#--------------------------------------------------------------------------
#
# .bashrc - Bash Shell environment settings
#
#
# Developed by Donnacha Forde (donnacha.forde@gmail.com)
#
# Copyright © 2001 - 2006, Donnacha Forde. All rights reserved.
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
# determine platform, user and hostname
#

OS=${OS:-`uname`}
HOSTNAME=${HOSTNAME:-`hostname`}
USERID=${USERID:-`logname`}

if test "$OS" = "Windows_NT"
then
	WHOAMI=${WHOAMI:-`/bin/whoami`}
else
	WHOAMI=${WHOAMI:-`/usr/ucb/whoami`}
fi

echo "Logged on '"$HOSTNAME"' as '"$USERID"' - Operating System is '"$OS"'"
echo
# show the OS type in a banner if the cmd is available
if test -f /usr/bin/banner
then
	banner $OS
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




