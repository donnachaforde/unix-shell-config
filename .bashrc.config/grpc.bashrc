# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde

echo "Loading gRPC configuration from .bashrc.config/grpc.bashrc"


#--------------------------------------------------------------------------
# gRPC

if [ -d $OPT_HOME/grpc ]; then

	# home
	GRPC_HOME=$OPT_HOME/grpc; export GRPC_HOME

	# path
	PATH=$PATH:$GRPC_HOME/bin; export PATH

	# libs
	LIBPATH=$LIBPATH:$GRPC_HOME/lib; export LIBPATH

	# man
	MANPATH=$MANPATH:$GRPC_HOME/man; export MANPATH
fi