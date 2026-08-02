# SPDX-License-Identifier: MIT
# Copyright (c) 2001-2026 Donnacha Forde

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
# This function will change the prompt when you're in a valid git branch.
# It will show the branch name and path, but not username/host.
# When not in a git repo, it will show username/host and path.
#
# Note: This function requires 'git-prompt.sh' to be sourced above.
# Note: This works the same as though you had set PS1 directly. (e.g. # PS1="$PS1"'`__git_ps1 "(%s)"`')
#
function my_git_prompt() {
    # Check if we are in a Git repository
    local git_status=$(__git_ps1 "(%s)")

    if [ -n "$git_status" ]; then
        # If in a repo, show Git status and path, but not username/host
		git_status=$(__git_ps1 "\[\e[35m\](%s)\[\e[m\]")
        PS1="$git_status\n\[\e[34m\]\w\[\e[m\]\$ "
    else
        # If not in a repo, show username, host, and path
        PS1='\[\e[32m\]\u@\h:\[\e[34m\]\w\[\e[m\]\$ '
    fi
}

# Tell Bash to execute this function before each command
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