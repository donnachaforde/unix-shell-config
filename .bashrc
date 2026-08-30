#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
#--------------------------------------------------------------------------
#
# Note: each block below is sourced conditionally - comment it out to
# disable, uncomment it to enable.
#

echo
echo "Bash Shell"
echo "Personal settings loaded from ~/.bashrc"
echo


#--------------------------------------------------------------------------
# Core Configuration
#

# Core settings: OS detection, history, paths, git integration
if test -f ~/.bashrc.config/core.bashrc
then
	. ~/.bashrc.config/core.bashrc
fi

# Login banner: host details, OS banner/figlet art, shell version, date/time
if test -f ~/.bashrc.config/motd.bashrc
then
	. ~/.bashrc.config/motd.bashrc
fi

# Prompt settings and window title behavior
if test -f ~/.bashrc.config/prompt.bashrc
then
	. ~/.bashrc.config/prompt.bashrc
fi

# General aliases
if test -f ~/.bashrc.config/aliases.bashrc
then
	. ~/.bashrc.config/aliases.bashrc
fi


#--------------------------------------------------------------------------
# Optional Configurations
#

# Git configuration
#if test -f ~/.bashrc.config/git.bashrc
#then
#	. ~/.bashrc.config/git.bashrc
#fi

# X11 display configuration (mainly for remote X forwarding)
#if test -f ~/.bashrc.config/x-display.bashrc
#then
#	. ~/.bashrc.config/x-display.bashrc
#fi

# Cygwin configuration (only if you're actually working in a Cygwin shell)
#if test -f ~/.bashrc.config/cygwin.bashrc
#then
#	. ~/.bashrc.config/cygwin.bashrc
#fi

# Java development
#if test -f ~/.bashrc.config/java.bashrc
#then
#	. ~/.bashrc.config/java.bashrc
#fi

# Maven development
#if test -f ~/.bashrc.config/maven.bashrc
#then
#	. ~/.bashrc.config/maven.bashrc
#fi

# CMake and C/C++ development
#if test -f ~/.bashrc.config/cmake.bashrc
#then
#	. ~/.bashrc.config/cmake.bashrc
#fi

# C++ toolchain: compiler discovery, vcpkg, ccache, debugger/format aliases
#if test -f ~/.bashrc.config/cpp.bashrc
#then
#	. ~/.bashrc.config/cpp.bashrc
#fi

# Individual development tools

# Beyond Compare CLI
#if test -f ~/.bashrc.config/beyondcompare.bashrc
#then
#	. ~/.bashrc.config/beyondcompare.bashrc
#fi

# gRPC development
#if test -f ~/.bashrc.config/grpc.bashrc
#then
#	. ~/.bashrc.config/grpc.bashrc
#fi

# Golang development
#if test -f ~/.bashrc.config/golang.bashrc
#then
#	. ~/.bashrc.config/golang.bashrc
#fi

# Rust development
#if test -f ~/.bashrc.config/rust.bashrc
#then
#	. ~/.bashrc.config/rust.bashrc
#fi

# GPG configuration
#if test -f ~/.bashrc.config/gpg.bashrc
#then
#	. ~/.bashrc.config/gpg.bashrc
#fi

# PostgreSQL development
#if test -f ~/.bashrc.config/postgres.bashrc
#then
#	. ~/.bashrc.config/postgres.bashrc
#fi

# Python development
#if test -f ~/.bashrc.config/python.bashrc
#then
#	. ~/.bashrc.config/python.bashrc
#fi


echo
