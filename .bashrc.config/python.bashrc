#--------------------------------------------------------------------------
#
# python.bashrc - Python configuration
#
# Copyright © 2001 - 2025 Donnacha Forde. All rights reserved.
#
# This software is provided 'as is' without warranty, expressed or implied.
# Donnacha Forde accepts no responsibility for its use or reliability.
#
#--------------------------------------------------------------------------

echo "Loading Python configuration from .bashrc.config/python.bashrc"


#--------------------------------------------------------------------------
# Python

# add the versioned symlinks to the path
if test "$OS" = "Darwin"
then
	if [ -d $BREW_HOME/opt/python/libexec/bin ]; then
		PATH=$PATH:$BREW_HOME/opt/python/libexec/bin; export PATH
	fi
fi