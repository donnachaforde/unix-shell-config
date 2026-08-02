#--------------------------------------------------------------------------
#
# golang.bashrc - Golang configuration
#
# Copyright © 2001 - 2026 Donnacha Forde. All rights reserved.
#
# This software is provided 'as is' without warranty, expressed or implied.
# Donnacha Forde accepts no responsibility for its use or reliability.
#
#--------------------------------------------------------------------------

echo "Loading Golang configuration from .bashrc.config/golang.bashrc"


#--------------------------------------------------------------------------
# Golang

if [ -d $OPT_HOME/Go ]; then

	# home
	GOLANG_HOME=$OPT_HOME/Go; export GOLANG_HOME

	# path
	PATH=$PATH:$GOLANG_HOME/bin; export PATH
fi