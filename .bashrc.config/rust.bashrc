# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde

echo "Loading Rust configuration from .bashrc.config/rust.bashrc"


#--------------------------------------------------------------------------
# Rust / Cargo environment

if [ -f $HOME/.cargo/env ]; then
	CARGO_HOME=${CARGO_HOME:-$HOME/.cargo}; export CARGO_HOME
	RUSTUP_HOME=${RUSTUP_HOME:-$HOME/.rustup}; export RUSTUP_HOME
	. $HOME/.cargo/env
fi
