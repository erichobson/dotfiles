#!/bin/zsh

# FZF completion and key bindings
if (( $+commands[fzf] )); then
    source <(fzf --zsh)
else
    echo "fzf not found in PATH. Please ensure it is installed."
fi

# Sketchybar brew update trigger
if (( $+commands[brew] )); then
    function brew() {
        command brew "$@"
        if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]]; then
            sketchybar --trigger brew_update
        fi
    }
fi

# Zoxide initialization
if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
else
    echo "zoxide not found in PATH. Please ensure it is installed."
fi

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

