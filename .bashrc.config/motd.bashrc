# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde


#--------------------------------------------------------------------------
# OS banner art
#
# Note: relies on OS and OPT_HOME already being set by core.bashrc, so this
# must be sourced after it.

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
# host details, shell version, date & time
#
# Note: relies on USERID, HOSTNAME and MACHINE already being set by
# core.bashrc. $BASH_VERSION is the actual running shell's version - unlike
# shelling out to a hardcoded path like /bin/bash, it can't go stale if the
# shell you're actually running isn't the one at that fixed location.

echo "Logged on as "$'\033[1;32m'"$USERID"$'\033[0m'" on "$HOSTNAME" running "$OS" on "$MACHINE""

# green if this is a reasonably modern bash, red as a nudge if it's an old/stock one
if [ "${BASH_VERSINFO[0]}" -ge 5 ]
then
	echo "bash "$'\033[1;32m'"$BASH_VERSION"$'\033[0m'
else
	echo "bash "$'\033[1;31m'"$BASH_VERSION"$'\033[0m'" (outdated - consider upgrading)"
fi

echo
date
