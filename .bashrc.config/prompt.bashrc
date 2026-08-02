#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
#--------------------------------------------------------------------------

#--------------------------------------------------------------------------
# prompt & window title
#
# Different bash implementations have different setting syntax so we adjust 
# by platform, etc.
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
