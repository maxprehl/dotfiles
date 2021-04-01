# .bash_profile
#
# MAINTAINER: Max Prehl <max_prehl@vanguard.com>
# UPDATED: Nov. 19, 2020
#
# This is a bash profile for Mac OSX (10.15)
# Environment variables are set here

# export NODE_ENV=local
# export HOSTNAME=localhost

# proxy
# export HTTPS_PROXY=
# export HTTP_PROXY=

# stop MacOS zsh default shell message
export BASH_SILENCE_DEPRECATION_WARNING=1

# Add Visual Studio Code (code)
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# export PATH="/usr/local/lib/node_modules/npm:$PATH"
# export PATH="$HOME/.npm-global/bin:$PATH"

# export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
# export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

export EDITOR="vim"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
