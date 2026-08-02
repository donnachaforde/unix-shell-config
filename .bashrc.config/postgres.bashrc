# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde

echo "Loading PostgreSQL configuration from .bashrc.config/postgres.bashrc"


#--------------------------------------------------------------------------
# postgres - psql

# add (homebrew) postgres binaries to the path
if test "$OS" = "Darwin"
then
	if [ -d $BREW_HOME/opt/libpq/bin ]; then
		PATH=$PATH:$BREW_HOME/opt/libpq/bin; export PATH
	fi

#	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BREW_HOME/opt/libpq/lib; export LD_LIBRARY_PATH
#	LDFLAGS="-L$BREW_HOME/opt/libpq/lib"; export LDFLAGS
#	CPPFLAGS="-I$BREW_HOME/opt/libpq/include"; export CPPFLAGS
fi