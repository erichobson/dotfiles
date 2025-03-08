#!/bin/zsh

# NOTE: This file is symlinked from $ZDOTDIR/.zshenv to ~/.zshenv
# It is loaded first for all shell types (login, interactive, non-interactive)

# XDG Base Directory Specification
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

# Zsh directory
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Terminal settings
export TERM=xterm-256color

# Load Rust environment if available
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Source .zprofile for non-login, non-interactive shells
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprofile"
fi
