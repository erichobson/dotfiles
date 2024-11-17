#!/bin/zsh

if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
else
    echo "zoxide not found in PATH. Please ensure it is installed."
fi
