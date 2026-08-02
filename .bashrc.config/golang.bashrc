# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde

echo "Loading Golang configuration from .bashrc.config/golang.bashrc"


#--------------------------------------------------------------------------
# Golang

if [ -d $OPT_HOME/Go ]; then

	# home
	GOLANG_HOME=$OPT_HOME/Go; export GOLANG_HOME

	# path
	PATH=$PATH:$GOLANG_HOME/bin; export PATH
fi