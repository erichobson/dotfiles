#!/bin/zsh

if (( $+commands[fzf] )); then
    source <(fzf --zsh)
else
    echo "fzf not found in PATH. Please ensure it is installed."
    return -1
fi

export FZF_DEFAULT_OPTS="
--height 40%
--layout=reverse
--border
--color=fg:#D5D6C8,bg:#232A2E,hl:#DBBC7F
--color=fg+:#D5D6C8,bg+:#3F4D52,hl+:#B2C98F
--color=info:#D5D6C8,prompt:#93C9A1,pointer:#E67E80
--color=marker:#E3A8D1,spinner:#9BB5CF,header:#D5D6C8
"
