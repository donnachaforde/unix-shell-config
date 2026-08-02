#--------------------------------------------------------------------------
#
# grpc.bashrc - gRPC configuration
#
# Copyright © 2001 - 2026 Donnacha Forde. All rights reserved.
#
# This software is provided 'as is' without warranty, expressed or implied.
# Donnacha Forde accepts no responsibility for its use or reliability.
#
#--------------------------------------------------------------------------

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