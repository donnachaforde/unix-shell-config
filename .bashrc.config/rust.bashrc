# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde

BASHRC_LOADED="$BASHRC_LOADED rust"


#--------------------------------------------------------------------------
# Rust / Cargo environment

if [ -f $HOME/.cargo/env ]; then
	CARGO_HOME=${CARGO_HOME:-$HOME/.cargo}; export CARGO_HOME
	RUSTUP_HOME=${RUSTUP_HOME:-$HOME/.rustup}; export RUSTUP_HOME
	. $HOME/.cargo/env
fi
