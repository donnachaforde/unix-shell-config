echo
echo "Bash profile triggered."
echo

# let's just ignore that annoying little message from Apple
export BASH_SILENCE_DEPRECATION_WARNING=1

# load bash settings
. ~/.bashrc

# On macOS, configure bash as preferred shell in Terminal->Preferences - otherwise, uncomment following lines to immediately launch bash (on top of zsh)
#echo "Switching to Bash..."
#/bin/bash
