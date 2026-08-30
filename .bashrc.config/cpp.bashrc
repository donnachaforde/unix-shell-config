# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde

echo "Loading C++ development configuration from .bashrc.config/cpp.bashrc"


#--------------------------------------------------------------------------
# compiler toolchain - Windows (MSVC + MinGW)

if test "$OS" = "Windows_NT"
then
	# locate the newest installed VS edition (Community/Professional/Enterprise, 2022 then 2019)
	for edition in Professional Enterprise Community; do
		for year in 2022 2019; do
			candidate="/c/Program Files/Microsoft Visual Studio/$year/$edition"
			if [ -d "$candidate" ]; then
				VS_HOME="$candidate"
				break 2
			fi
		done
	done
	export VS_HOME

	# bridge cl.exe/dumpbin.exe/nmake.exe env into this shell by running vcvarsall.bat
	# and importing the PATH/INCLUDE/LIB it produces. Run once per shell before using cl.
	vcvars() {
		if [ -z "$VS_HOME" ]; then
			echo "vcvars: no Visual Studio installation found under Program Files" >&2
			return 1
		fi

		local arch="${1:-x64}"
		local vcvarsall="$VS_HOME/VC/Auxiliary/Build/vcvarsall.bat"
		if [ ! -f "$vcvarsall" ]; then
			echo "vcvars: vcvarsall.bat not found at $vcvarsall" >&2
			return 1
		fi

		local winvcvarsall
		winvcvarsall=$(cygpath -w "$vcvarsall")

		while IFS='=' read -r name value; do
			case "$name" in
				PATH)
					export PATH="$(cygpath -u -p "$value"):$PATH"
					;;
				INCLUDE|LIB|LIBPATH)
					export "$name=$value"
					;;
			esac
		done < <(cmd.exe /c "\"$winvcvarsall\" $arch && set" 2>/dev/null)
	}

	# MinGW/MSYS2 toolchain (gcc/g++ for Windows) - alternative to MSVC
	if [ -d $OPT_HOME/msys64 ]; then
		PATH=$PATH:$OPT_HOME/msys64/usr/bin:$OPT_HOME/msys64/mingw64/bin
		export PATH

		# Perl is needed by some MinGW C/C++ builds (e.g. OpenSSL)
		PATH=$PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
		export PATH
	fi

	# ninja and nasm - common companions to either toolchain above
	if [ -d $OPT_HOME/ninja ]; then
		PATH=$PATH:$OPT_HOME/ninja; export PATH
	fi

	if [ -d $OPT_HOME/nasm ]; then
		PATH=$PATH:$OPT_HOME/nasm; export PATH
	fi
fi


#--------------------------------------------------------------------------
# compiler toolchain - macOS

if test "$OS" = "Darwin"
then
	# prefer Homebrew LLVM/clang over the Xcode Command Line Tools version, if installed
	if [ -d $BREW_HOME/opt/llvm ]; then
		LLVM_HOME=$BREW_HOME/opt/llvm; export LLVM_HOME
		PATH=$LLVM_HOME/bin:$PATH; export PATH
	fi
fi


#--------------------------------------------------------------------------
# vcpkg - cross-platform C/C++ package manager

if [ -d $OPT_HOME/vcpkg ]; then
	VCPKG_ROOT=$OPT_HOME/vcpkg; export VCPKG_ROOT
elif [ -d $BREW_HOME/opt/vcpkg ]; then
	VCPKG_ROOT=$BREW_HOME/opt/vcpkg; export VCPKG_ROOT
fi

if [ -n "$VCPKG_ROOT" ]; then
	PATH=$PATH:$VCPKG_ROOT; export PATH
	alias vcpkg-integrate='vcpkg integrate install'
fi


#--------------------------------------------------------------------------
# ccache - compiler cache for faster rebuilds
#
# Note: MSVC (cl.exe) support requires wiring ccache in via
# CMAKE_<LANG>_COMPILER_LAUNCHER rather than CC/CXX, so it's left out here.

if command -v ccache > /dev/null 2>&1
then
	if ! test "$OS" = "Windows_NT"
	then
		export CC="ccache gcc"
		export CXX="ccache g++"
	fi
fi


#--------------------------------------------------------------------------
# debugger

if test "$OS" = "Darwin"
then
	alias dbg=lldb
else
	alias dbg=gdb
fi


#--------------------------------------------------------------------------
# formatting / linting aliases

alias cfmt='clang-format -i'
alias ctidy=clang-tidy
