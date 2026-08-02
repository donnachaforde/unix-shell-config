#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
#--------------------------------------------------------------------------

echo "Loading GPG configuration from .bashrc.config/gpg.bashrc"


#--------------------------------------------------------------------------
# gpg env integration

# set up gpg on macOS
if test "$OS" = "Darwin"
then
	# if the gpg command is exists in the home brew directory
	if [ -f $BREW_HOME/bin/gpg ]; then

		echo "Setting up GPG for macOS..."

		# set shell var for pgp
		GPG_TTY=$(tty); export GPG_TTY
	fi
fi