#!/bin/zsh

# Single Character Aliases
alias _=sudo
alias g=git
alias l=lsd
alias v=nvim

# Directory Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'

# Directory Listing
alias ls='lsd'
alias ll='lsd -lh'
alias la='lsd -lAh'
alias ldot='lsd -ld .*'
alias tree='lsd --tree'

# File Operations
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

# Search and Find
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias grep='grep --color=auto'
# alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

# System Operations
alias update='topgrade'
alias please=sudo
alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h now'
alias ports='netstat -tulanp'

# Application Shortcuts
alias vi=nvim
alias vim=nvim
alias sql='sqlite3'
alias py='python3'
alias ipy='ipython'

# Git Shortcuts
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gst='git status'
alias gd='git diff'
alias gco='git checkout'

# Tar Operations
alias tarls="tar -tvf"
alias untar="tar -xf"

# Zsh Related
alias zshrc='${EDITOR:-nvim} "${ZDOTDIR:-$HOME}"/.zshrc'
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
alias zdot='cd ${ZDOTDIR:-~}'
alias reload='source ~/.zshrc'

# Networking
alias myip='curl http://ipecho.net/plain; echo'
alias ping='ping -c 5'
alias ipe='curl ipinfo.io/ip'
alias speedtest='speedtest-cli'

# Misc and Custom
alias weather='curl wttr.in'
alias c='clear'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias vault='cd /Users/eric/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Vault'

# Typo Corrections
alias quit='exit'
alias cd..='cd ..'

# Docker (if you use it)
alias dps='docker ps'
alias dimg='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias drun='docker run'

# npm (if you use Node.js)
alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install -g'
alias nr='npm run'
alias nst='npm start'
alias nt='npm test'

# Python Virtual Environment
alias venv='python3 -m venv ./venv'
alias activate='source ./venv/bin/activate'

# macOS Specific (if applicable)
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
