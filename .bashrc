#--------------------------------------------------------------------------
#
# .bashrc - Bash Shell environment settings
#
# Copyright © 2001 - 2026 Donnacha Forde. All rights reserved.
#
# This software is provided 'as is' without warranty, expressed or implied.
# Donnacha Forde accepts no responsibility for its use or reliability.
#
#--------------------------------------------------------------------------

echo
echo "Bash Shell"
echo "Personal settings loaded from ~/.bashrc"
echo


#--------------------------------------------------------------------------
# Core Configuration
#

# Core settings: OS detection, history, prompt, paths, git integration
if test -f ~/.bashrc.config/core.bashrc
then
	. ~/.bashrc.config/core.bashrc
fi

# General aliases (recommended to always enable)
if test -f ~/.bashrc.config/aliases.bashrc
then
	. ~/.bashrc.config/aliases.bashrc
fi


#--------------------------------------------------------------------------
# Optional Configurations
#
#
# Note: Uncomment to enable tool configurations as needed for your current work
#

# Git configuration (recommended to always enable for developers)
if test -f ~/.bashrc.config/git.bashrc
then
	. ~/.bashrc.config/git.bashrc
fi

# X11 display configuration (optional - mainly for remote X forwarding)
# Uncomment the following line if you need X11/xterm functionality
#if test -f ~/.bashrc.config/x-display.bashrc
#then
#	. ~/.bashrc.config/x-display.bashrc
#fi

# Java development
# Uncomment the following line if you're working with Java projects
#if test -f ~/.bashrc.config/java.bashrc
#then
#	. ~/.bashrc.config/java.bashrc
#fi

# Maven development
# Uncomment the following line if you're working with Maven projects
#if test -f ~/.bashrc.config/maven.bashrc
#then
#	. ~/.bashrc.config/maven.bashrc
#fi

# CMake and C/C++ development
# Uncomment the following line if you're working with CMake/C/C++ projects
#if test -f ~/.bashrc.config/cmake.bashrc
#then
#	. ~/.bashrc.config/cmake.bashrc
#fi

# Individual development tools (uncomment as needed)
# Uncomment the following lines for specific technologies you need

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
