#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
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