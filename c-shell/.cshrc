#--------------------------------------------------------------------------
#
# .cshrc - C Shell environment settings 
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
echo "C Shell"
echo "Personal settings loaded from ~/.cshrc"
echo 


#--------------------------------------------------------------------------
# prompt & window title
#

set prompt="${cwd}% "


#--------------------------------------------------------------------------
# environment settings
#

umask 022

set complete=enhance
set autolist

# cmd history
if ( $?prompt ) then
	set noclobber ignoreeof
	set history=100 savehist=25
	set filec
endif

#setenv EDITOR $KDEDIR/bin/kate
#setenv WINEDITOR $KDEDIR/bin/kate
#setenv EDITOR /usr/bin/vi
#setenv WINEDITOR /usr/bin/vi
#setenv GNOME_PATH /opt/gnome
#setenv MOZILLA_HOME /opt/netscape
#setenv KDEDIR /opt/kde
#setenv QTDIR /opt/kde/qt

# Java environment
setenv JAVA_HOME /opt/j2sdk1.4.0
setenv JDK_DIR /opt/java



#--------------------------------------------------------------------------
# path settings
#

# binaries
set path =  (						\
			/bin					\
			/sbin					\
			/usr/bin				\
			/usr/sbin				\
			/usr/local/bin			\
			/usr/local/sbin			\
			/usr/ucb				\
			/usr/ccs/bin			\
			/usr/dt/bin				\
			/usr/proc/bin			\
			$JAVA_HOME/bin			\
			$JDK_DIR/bin			\
			/usr/openwin/bin		\
			/usr/dt/bin				\
			$HOME/bin				\
			/opt/SUNWspro/bin		\
			)

# library path
setenv LD_LIBRARY_PATH .:/lib:/usr/lib:/usr/local/lib:/usr/ccs/lib:/usr/ucblib

#man path
setenv MANPATH /usr/local/man:/usr/share/man:/usr/openwin/man:/usr/dt/man:/opt/SUNWspro/man


#--------------------------------------------------------------------------
# ClearCase environment
#

# if clearcase is installed, we can add the view name to the prompt
if ( -e /opt/rational/clearcase/bin/cleartool ) then
	
	#prompt
	set view=(`/opt/rational/clearcase/bin/cleartool pwv -short | sed 's/*//g'`)
	if ( "$view" != "NONE") then
		set view = "("$view")"
		set prompt="$view `pwd`% "
	endif
	
	# path - ensure cleartool (alias ct) is before /usr/bin/ct
	setenv PATH ${PATH}:/opt/rational/clearcase/bin:/opt/rational/clearcase/etc:/opt/rational/clearcase/etc/utils

	# libs	
	setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:/opt/rational/clearcase/shlib
	
	# man
	setenv MANPATH ${MANPATH}:/opt/rational/clearcase/doc/man
	
	# alias
	alias ct cleartool
endif


#--------------------------------------------------------------------------
# ClearQuest settings
#

if ( -e /opt/rational/clearquest/bin/clearquest ) then
	
	setenv CQ_HOME /opt/rational/clearquest
	
	# path	
	setenv PATH ${PATH}:/opt/rational/clearquest/bin

	# lib path
	setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:/opt/rational/clearquest/shlib
	
	# man
	setenv MANPATH ${MANPATH}:/opt/rational/clearquest/doc/man
endif


#--------------------------------------------------------------------------
# external settings
#

# display
if ( -e ~/.cshrc.display ) then
	source ~/.cshrc.display
endif

# aliases
if ( -e ~/.cshrc.alias ) then
	source ~/.cshrc.alias
endif




#--------------------------------------------------------------------------
# display date & time 
#

date
echo 
echo 
