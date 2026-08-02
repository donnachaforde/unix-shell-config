#--------------------------------------------------------------------------
#
# gpg.bashrc - GPG configuration
#
# Copyright © 2001 - 2025 Donnacha Forde. All rights reserved.
#
# This software is provided 'as is' without warranty, expressed or implied.
# Donnacha Forde accepts no responsibility for its use or reliability.
#
#--------------------------------------------------------------------------

echo "Loading GPG configuration from .bashrc.config/gpg.bashrc"


#--------------------------------------------------------------------------
# gpg

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