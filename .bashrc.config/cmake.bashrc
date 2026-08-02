#--------------------------------------------------------------------------
#
# cmake.bashrc - CMake configuration and aliases
#
# Copyright © 2001 - 2026 Donnacha Forde. All rights reserved.
#
# This software is provided 'as is' without warranty, expressed or implied.
# Donnacha Forde accepts no responsibility for its use or reliability.
#
#--------------------------------------------------------------------------

echo "Loading CMake configuration from .bashrc.config/cmake.bashrc"


#--------------------------------------------------------------------------
# CMake

if [ -d $OPT_HOME/CMake ]; then

	# home
	CMAKE_HOME=$OPT_HOME/CMake; export CMAKE_HOME

	# path
	PATH=$PATH:$CMAKE_HOME/bin; export PATH

	# alias
	alias cm=cmake
fi

# On macOS, the app install goes in the Applications folder
if test "$OS" = "Darwin"
then
	if [ -d /Applications/CMake.app ]; then

		# home
		CMAKE_HOME=/Applications/CMake.app/Contents; export CMAKE_HOME

		# path
		PATH=$PATH:$CMAKE_HOME/bin; export PATH

		# alias
		alias cm=cmake
	fi
fi

#--------------------------------------------------------------------------
# aliases

alias cmk=cmake

# generate build files
alias cmkg='cmake -S ./src -B ./build -DCMAKE_BUILD_TYPE=Debug'

# build the project
alias cmkb='cmake --build ./build --clean-first --config Debug'

# build with verbose output
alias cmkbv='cmake --build ./build --verbose --clean-first --config Debug'

# clean the build directory
alias cmkc='cmake --build ./build --verbose --target clean'

# test the project
alias cmkt='ctest --test-dir ./build'

# test the project with verbose output
alias cmktv='ctest --test-dir ./build --rerun-failed --output-on-failure'

# install the project
alias cmki='cmake --install ./build --prefix ./install'

# install release build of the project
alias cmkir='sudo cmake --install ./build --config Release'

# uninstall the project
alias cmku='cmake --build ./build --target uninstall'
