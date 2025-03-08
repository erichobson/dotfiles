#!/bin/zsh

# History configuration
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"  # History file location
HISTSIZE=50000                          # Maximum events in internal history
SAVEHIST=10000                          # Maximum events in history file

# History options
setopt EXTENDED_HISTORY                 # Write timestamps to history
setopt HIST_EXPIRE_DUPS_FIRST          # Expire duplicate entries first
setopt HIST_IGNORE_DUPS                # Don't record duplicates
setopt HIST_IGNORE_SPACE               # Don't record commands starting with space
setopt HIST_VERIFY                     # Don't execute immediately upon history expansion
setopt SHARE_HISTORY                   # Share history between sessions
