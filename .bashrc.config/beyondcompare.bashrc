# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde

BASHRC_LOADED="$BASHRC_LOADED beyondcompare"


#--------------------------------------------------------------------------
# Beyond Compare CLI

# On macOS, the app bundle ships a 'bcomp' CLI - e.g. bcomp v0.2.0.yml v0.2.1.yml
if test "$OS" = "Darwin"
then
	if [ -d "/Applications/Beyond Compare.app/Contents/MacOS" ]; then
		BCOMPARE_HOME="/Applications/Beyond Compare.app/Contents/MacOS"; export BCOMPARE_HOME
		PATH=$PATH:$BCOMPARE_HOME; export PATH
	fi
fi
