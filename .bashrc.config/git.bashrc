#--------------------------------------------------------------------------
# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde
#--------------------------------------------------------------------------

echo "Loading Git configuration from .bashrc.config/git.bashrc"


#--------------------------------------------------------------------------
# Git environment

# On Windows, git gets installed with 'GitBash', under the 'cmd' directory
if test "$OS" = "Windows_NT"
then
	if [ -d /cmd ]; then

		# home
		GIT_HOME=/cmd; export GIT_HOME

		# path
		PATH=$PATH:$GIT_HOME; export PATH

		# give path preferene to OpenSSH commands, used by Git
		OPENSSH_HOME=/c/Windows/System32/OpenSSH; export OPENSSH_HOME;
		PATH=$OPENSSH_HOME:$PATH; export PATH
	fi
fi

# Note: On macOS, we've given path preference to using 'brew' commands over default in path settings
# so we'll pick up the 'brew' installed git.


#--------------------------------------------------------------------------
# aliases

# alias - provide the git aliases regardless of where installed
alias gs='git status -s'
alias gd='git diff --name-only --cached'
alias gl='git log --oneline'
alias gc='git commit'
alias ga='git add'
alias gf='git fetch'
alias gsc='git log origin/main..HEAD --oneline'
alias gsh='git show --show-signature'


#--------------------------------------------------------------------------
# Git prompt - show the current git branch in the prompt if in a git repo
#

# source git-prompt based on OS
if test "$OS" = "Linux"
then
	if test -f /usr/share/git/completion/git-prompt.sh
	then
		source /usr/share/git/completion/git-prompt.sh
	fi
elif test "$OS" = "Darwin"
then
	if test -f /opt/homebrew/etc/bash_completion.d/git-prompt.sh
	then
		source /opt/homebrew/etc/bash_completion.d/git-prompt.sh
	fi
fi

# uncomment the lines below to show git branch in prompt
GIT_PS1_SHOWDIRTYSTATE=1
#GIT_PS1_SHOWSTASHSTATE=1
#GIT_PS1_SHOWUNTRACKEDFILES=1
#GIT_PS1_SHOWUPSTREAM="auto"

# some basic ways to set the prompt with git branch info
# PS1="$PS1"'`__git_ps1 "(%s)"`'
# GIT_PROMPT=$(__git_ps1 "(%s)")
# PS1="$GIT_PROMPT $PS1"

#
# Keep the base prompt as the authoritative prompt source.
# Git should only decorate the existing prompt with branch information when
# the current working directory is inside a Git repository.
#
# Note: This function requires 'git-prompt.sh' to be sourced above.
#
GIT_PROMPT_BASE="$PS1"

function my_git_prompt() {
    local git_status

    git_status=$(__git_ps1 "\[\e[35m\](%s)\[\e[m\]")

    if [ -n "$git_status" ]; then
        PS1="$git_status\n$GIT_PROMPT_BASE"
    else
        PS1="$GIT_PROMPT_BASE"
    fi
}

# Tell Bash to execute this function before each command.
# It preserves the platform's base prompt and only adds the Git branch marker.
PROMPT_COMMAND=my_git_prompt


#--------------------------------------------------------------------------
# source git autocomplete
#

# On Linux, if git installed via package manager, the completion script is in /usr/share/git/completion
if test "$OS" = "Linux"
then
	if test -f /usr/share/git/completion/git-completion.bash
	then
		. /usr/share/git/completion/git-completion.bash
	fi
fi

# On Windows, if git installed via GitBash, the completion script is in the home directory (manually downloaded)
if test "$OS" = "Windows_NT"
then
	if test -f ~/.git-completion.bash
	then
		. ~/.git-completion.bash
	fi
fi

# On macOS, if git installed via brew, it's in /opt/homebrew/etc/bash_completion.d/git-completion.bash
if test "$OS" = "Darwin"
then
	if test -f /opt/homebrew/etc/bash_completion.d/git-completion.bash
	then
		. /opt/homebrew/etc/bash_completion.d/git-completion.bash
	fi
fi