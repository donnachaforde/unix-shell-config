# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde

echo "Loading login banner from .bashrc.config/motd.bashrc"


#--------------------------------------------------------------------------
# display details of the current host
#
# Note: relies on OS, MACHINE, USERID, HOSTNAME and OPT_HOME already being
# set by core.bashrc, so this must be sourced after it.

echo "Logged on as "$USERID" on "$HOSTNAME" running "$OS" on "$MACHINE""
echo

#
# show the OS type in a banner
#

# on Windows, we can use the cygwin banner command (even from GitBash)
if test "$OS" = "Windows_NT"
then
	# use cygwin banner.exe command, even from GitBash
	if test -f $OPT_HOME/cygwin64/bin/banner
	then
		$OPT_HOME/cygwin64/bin/banner Windows
	fi
fi

# on macOS, 'banner' cmd on macOS displays on its side so favour 'figlet'  ('brew install figlet')
if test "$OS" = "Darwin"
then
	if test -f /opt/homebrew/bin/figlet
	then
		/opt/homebrew/bin/figlet macOS
	fi
fi

# on Linux, we can use the banner command
if test "$OS" = "Linux"
then
	if test -f /usr/bin/banner
	then
		banner $OS
	fi
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
