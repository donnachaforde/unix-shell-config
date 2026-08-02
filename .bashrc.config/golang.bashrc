#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
#--------------------------------------------------------------------------

echo "Loading Golang configuration from .bashrc.config/golang.bashrc"


#--------------------------------------------------------------------------
# Golang env settings

if [ -d $OPT_HOME/Go ]; then

	# home
	GOLANG_HOME=$OPT_HOME/Go; export GOLANG_HOME
	GOROOT=$GOLANG_HOME; export GOROOT
	GOPATH=${GOPATH:-$HOME/go}; export GOPATH
	GOBIN=$GOPATH/bin; export GOBIN

	# path
	PATH=$PATH:$GOROOT/bin:$GOBIN; export PATH
fi