#--------------------------------------------------------------------------
#
# x-display.bashrc - X11 display and terminal configuration
#
# Copyright © 2001 - 2025 Donnacha Forde. All rights reserved.
#
# This software is provided 'as is' without warranty, expressed or implied.
# Donnacha Forde accepts no responsibility for its use or reliability.
#
#--------------------------------------------------------------------------

echo "Loading X11 configuration from .bashrc.config/x-display.bashrc"

# Set default X display terminal
DISPLAY=0.0.0.0:0.0; export DISPLAY

#--------------------------------------------------------------------------
# X binaries

# usually non-standard on Solaris and HP-UX
if test "$OS" = "SunOS"
then
XTERM_HOME=/usr/X; export XTERM_HOME
else if test "$OS" = "HP-UX"
then
XTERM_HOME=/usr/X11; export XTERM_HOME
else
# default location
XTERM_HOME=/usr/X11R6/bin; export XTERM_HOME
fi
fi

if [ -d "$XTERM_HOME" ]; then

# path
PATH=$PATH:$XTERM_HOME/sbin; export PATH

# alias (xterm short-cuts - provide fore-ground colour - e.g. -fg green)
alias xt=xterm
alias xtx="xterm -sb -sl 999 -bg black -fn arial "
alias xwin="xterm -sb -sl 999 -fg white -bg black -fn arial "

fi
