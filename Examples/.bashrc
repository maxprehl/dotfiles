# .bashrc - 4/2014
# Kurt Schmidt
#
# Intended for CS265 students, folk new to Ubuntu
#		- anticipates vi users
#
# EDITOR:  tabstop=2, cols=80
#

# User specific aliases and functions

# Add whatever you want to see after logging in here.

	# Specify that ^D won't log you out.
set -o ignoreeof 

	# don't let redirection clobber a file
set -o noclobber

	# make vi the command-line editor
	# comment out to use emacs mode (the default)
set -o vi

	# Uncomment to deny `talk' and `write' requests
# mesg n

alias l="ls -CF"
nc="$(tput colors)"
if (( nc >= 8 )) ; then
	alias ls="ls --color=auto"
fi
alias r="fc -s"
alias h="history"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

	# You can type 'lh' at the command line.  Try it, see what happens.
function lh
{
	ls -ot "${1:-.}" | head
}

## VARIABLES
	# set prompt, though maybe already done in /etc/bashrc
	#		see man or info pages for special characters (\u, etc.)
export PS1="\u@\h \W> "

	# things you don't want stored in your history list (consecutive
	# duplicates, ls, bg, fg, exit)
export HISTIGNORE="&:l:[bf]g:exit"

