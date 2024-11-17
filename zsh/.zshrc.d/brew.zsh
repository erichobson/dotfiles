#!/bin/zsh

if (( $+commands[brew] )); then
    eval $(brew shellenv)
else
    echo "brew not found in PATH. Please ensure it is installed."
    return -1
fi
