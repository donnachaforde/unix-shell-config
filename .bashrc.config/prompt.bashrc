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

# Ubuntu-style prompt support on Linux and Debian-based systems
if test "$OS" = "Linux"
then
	# set variable identifying the chroot you are in (used in the prompt below)
	if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]
	then
		debian_chroot=$(cat /etc/debian_chroot)
	fi

	# set a fancy prompt (non-color, unless we know we "want" color)
	case "$TERM" in
		xterm-color|*-256color) color_prompt=yes ;;
	esac

	# optionally force color output if requested
	if [ -n "$force_color_prompt" ]
	then
		if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null
		then
			# We have color support; assume it's compliant with Ecma-48
			# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
			# a case would tend to support setf rather than setaf.)
			color_prompt=yes
		else
			color_prompt=
		fi
	fi

	if [ "$color_prompt" = yes ]
	then
		PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	else
		PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	fi
	unset color_prompt force_color_prompt

	# If this is an xterm set the title to user@host:dir
	case "$TERM" in
		xterm*|rxvt*)
			PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
			;;
		*)
			;;
		esac
fi


# Windows - The Git Bash prompt on Windows is good enough so only uncomment if really necessary
if test "$OS" = "Windows_NT"
then
    #PS1='\[\033]1;\w\007\033[32m\033[33m\w\033[0m\]$ '
fi

# cygwin - Note: cygwin is not an xterm so it doesn't support 'title'
if test "$MACHINE" = "Cygwin"
then
 	PS1='\[\033]1;\w\007\033[32m\033[33m\w\033[0m\]$ '
fi


# MacOS - basic prompt is good enough so only uncomment block below if really necessary
if test "$OS" = "Darwin"
then
	#PS1="\u@\h \w$ "
fi


#--------------------------------------------------------------------------
# legacy OS 
#
# Notes:
#
# * AIX bash does not support the syntax used on SunOS and HP-UX. Setting 
#   title & prompt settings creates duplicate prompt. The default is 
#   plain text = userid@host ~$.
#

# IBM AIX
if test "$OS" = "AIX"
then
	PS1="\[\e]2;\u@\h\a\]\w$ "
fi

# HP-UX
if test "$OS" = "HP-UX"
then
	PS1="\[\e]2;\u@\h\a\e[34;1m\u \e[32;1m\w$ \e[0m\]"
fi

# SunOS Solaris
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


