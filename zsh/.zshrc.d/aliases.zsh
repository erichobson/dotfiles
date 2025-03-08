#!/bin/zsh

alias duck="ddgr"

# Required aliases (kept from original)
alias mlocal='make -f Makefile.local'
alias sys='macchina'

# Modern replacements for common commands
alias ls='eza --icons --git'                # Modern ls with icons and git status
alias ll='eza -l --icons --git'             # Long list
alias la='eza -la --icons --no-git'
alias lt='eza --tree --icons --git-ignore'  # Tree view
alias cat='bat'                             # Better cat with syntax highlighting
alias grep='rg'                             # Better grep with ripgrep
alias find='fd'                             # Better find with fd
alias top='procs'                           # Better top with procs
alias du='dust'                             # Better disk usage
alias diff='delta'                          # Better diff with git-delta

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# Git shortcuts (with lazygit available, keep these minimal)
alias g='git'
alias gs='git status -sb'                   # Short status
alias lg='lazygit'                          # Use lazygit for everything else

# Development
alias v='nvim'
alias py='python3'
alias pip='pip3'

# System operations
alias c='clear'
alias please='sudo'
alias ports='lsof -i -P -n | grep LISTEN'   # Show listening ports

# tmux
alias t='tmux attach || tmux new'           # Quick tmux attach/create
alias tn='tmux new -s'                      # New named session
alias ta='tmux attach -t'                   # Attach to session

# Directory and file operations
alias cp='cp -iv'                           # Interactive, verbose copy
alias mv='mv -iv'                           # Interactive, verbose move
alias mkdir='mkdir -pv'                     # Create parent dirs, verbose
alias rm='trash'                            # Use trash instead of rm

# Quick access
alias vault='cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Vault'

# Networking
alias ip='curl ipinfo.io'                   # Get IP info
alias weather='curl wttr.in'                # Get weather

# macOS specific
alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

# OpenStack
alias openstack="ssh -J erichobson@access.scs.carleton.ca student@134.117.134.117"
alias openstack-scp="scp -J erichobson@access.scs.carleton.ca student@134.117.134.117:/home/student/a2/erichobson-comp3000-assign2.tar.gz ."
