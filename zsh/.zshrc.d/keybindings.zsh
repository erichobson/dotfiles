#!/bin/zsh

# Ensure terminfo module is loaded
[[ -v terminfo ]] || zmodload zsh/terminfo

# Set vi mode timeout
export KEYTIMEOUT=20

#
# Vi Mode Bindings
#

# Normal mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M vicmd '^v' edit-command-line    # Edit command in editor

# Insert mode navigation
bindkey -M viins '^A' beginning-of-line    # Go to beginning of line
bindkey -M viins '^E' end-of-line         # Go to end of line
bindkey -M viins '^P' up-line-or-history  # Previous command
bindkey -M viins '^N' down-line-or-history # Next command

# Insert mode editing
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^U' kill-whole-line
bindkey -M viins '^K' kill-line           # Kill to end of line

# Search
bindkey -M viins '^R' history-incremental-search-backward

# # History substring search
# if [[ -n "$terminfo[kcuu1]" ]]; then
#     bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up    # Up arrow
# fi
# if [[ -n "$terminfo[kcud1]" ]]; then
#     bindkey -M viins "$terminfo[kcud1]" history-substring-search-down  # Down arrow
# fi

# Quick escape sequence
bindkey -M viins 'j' self-insert
bindkey -M viins 'k' self-insert
bindkey -M viins 'jk' vi-cmd-mode

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
