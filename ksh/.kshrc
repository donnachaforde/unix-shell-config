#--------------------------------------------------------------------------
#
# .kshrc - Korn Shell environment settings
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
echo "Korn Shell"
echo "Personal settings loaded from ~/.kshrc"
echo 


#--------------------------------------------------------------------------
# determine platform

OS=${OS:-`uname`}


#--------------------------------------------------------------------------
# prompt
#

PS1='$PWD$ '                          # e.g. /usr/local$


#--------------------------------------------------------------------------
# environment settings
#

set -o emacs		# cmd line editing

if test "$OS" = "Windows_NT"
then
	set -o noerrorbells	# disable beeping
	set -o tabcomplete	# use tab button for filename completion
else
	stty erase ^H
	SHELL=/bin/ksh
fi




#--------------------------------------------------------------------------
# path settings

# binaries
PATH=$PATH:.:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/ucb:/usr/ccs/bin:/usr/X11R6/bin:/usr/X11R6/sbin
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
# ClearCase environment

# add clearcase & clearquest
PATH=$PATH:/opt/rational/clearcase/bin:/opt/rational/clearquest/bin
export PATH

if test "$OS" = "SunOS"	
then
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/rational/clearcase/shlib:/usr/atria/shlib
	export LD_LIBRARY_PATH
else
	LIBPATH=$LIBPATH:/opt/rational/clearcase/shlib:/usr/atria/shlib
	export LIBPATH
fi

# man
MANPATH=$MANPATH:/opt/rational/clearcase/doc/man:/usr/atria/doc/man
export MANPATH

# alias
alias ct=cleartool



#--------------------------------------------------------------------------
# source X display

. ~/.kshrc.display


#--------------------------------------------------------------------------
# source aliases

. ~/.kshrc.alias




#--------------------------------------------------------------------------
# display date & time 

date
echo 


