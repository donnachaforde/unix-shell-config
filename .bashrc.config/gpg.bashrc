#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
#--------------------------------------------------------------------------

echo "Loading GPG configuration from .bashrc.config/gpg.bashrc"


#--------------------------------------------------------------------------
# gpg env integration

# set up gpg for interactive shells on Linux and macOS
if [ -x /usr/bin/gpg ] || [ -x $BREW_HOME/bin/gpg ]
then
	GPG_TTY=$(tty); export GPG_TTY
fi