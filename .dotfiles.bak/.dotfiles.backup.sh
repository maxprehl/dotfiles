#!/bin/bash
# .dotfiles.backup.sh
# 
# Author: Max Prehl
# Update: 2023-03-20
#

if [ -z "$1" ] ; then
    echo "Usage: $0 branch"
    exit 1
fi

if [ "$1" = "-h" -o "$1" = "--help" ] ; then
    echo "Usage: $0 branch"
    exit 1
fi

mkdir -p .dotfiles.bak && \
git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME checkout $1 2>&1 | egrep "\s+\." | awk {print } | \
xargs -I{} mv {} .dotfiles.bak/{}

