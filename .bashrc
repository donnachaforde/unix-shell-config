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



