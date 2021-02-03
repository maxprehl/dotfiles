# .bash_aliases
#
# MAINTAINER: Max Prehl
# UPDATED: Nov. 19, 2020

# Define os & *nix from https://stackoverflow.com/a/29239609
if_os () { [[ $OSTYPE == *$1* ]]; } # linux darwin msys bsd solaris
if_nix () { 
    case "$OSTYPE" in
        *linux*|*hurd*|*msys*|*cygwin*|*sua*|*interix*) sys="gnu";;
        *bsd*|*darwin*) sys="bsd";;
        *sunos*|*solaris*|*indiana*|*illumos*|*smartos*) sys="sun";;
    esac
    [[ "${sys}" == "$1" ]];
}

# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
    df="df -h" \
	mv="mv -iv" \
	rm="rm -vI" \
	mkd="mkdir -pv" \
	yt="youtube-dl --add-metadata -i" \
	yta="yt -x -f bestaudio/best" \
	ffmpeg="ffmpeg -hide_banner"
if_os darwin && alias rm="rm -iv"
# alias ll='ls -FGlAhp' # Preferred 'ls' implementation
# alias lsa='ls -al' # Show all file information
# alias less='less -FSRXc' # Preferred 'less' implementation

# Colorize commands when possible.
alias \
	grep="grep --color=auto" \
    fgrep='fgrep --color=auto' \
    egrep='egrep --color=auto' \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi"
## gnu/linux
if if_nix gnu && [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # export LS_COLORS="di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43"
    alias ls='ls -FhN --color=auto --group-directories-first'
    # alias dir='dir --color=auto'
    # alias vdir='vdir --color=auto'
fi
## mac/bsd
if_nix bsd &&
    export CLICOLOR=on &&
    export CLICOLORS=on &&
    export LSCOLORS="GxFxCxDxBxegedabagaced" &&
    alias ls='ls -Fh'

# These common commands are just too long! Abbreviate them.
alias \
    ll='ls -al' \
    g="git" \
    nr="npm run" \
    path='echo -e ${PATH//:/\\n}' \
    commasplit='awk -v RS=, {$0}' \
    alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
	# ka="killall" \

# Usage for alert, ex. `$ sleep 10; alert`
