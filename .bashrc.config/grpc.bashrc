#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
#--------------------------------------------------------------------------

BASHRC_LOADED="$BASHRC_LOADED grpc"


#--------------------------------------------------------------------------
# gRPC settings

if [ -d $OPT_HOME/grpc ]; then

	# home
	GRPC_HOME=$OPT_HOME/grpc; export GRPC_HOME

	# path
	PATH=$PATH:$GRPC_HOME/bin; export PATH

	# libs
	LIBPATH=$LIBPATH:$GRPC_HOME/lib; export LIBPATH
	PKG_CONFIG_PATH=${PKG_CONFIG_PATH:-}:$GRPC_HOME/lib/pkgconfig; export PKG_CONFIG_PATH

	# man
	MANPATH=$MANPATH:$GRPC_HOME/man; export MANPATH
fi