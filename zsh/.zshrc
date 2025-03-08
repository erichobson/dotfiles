#!/bin/zsh

# Load Zsh functions from directory
ZFUNCDIR=${ZDOTDIR:-$HOME}/.zfunctions
fpath=($ZFUNCDIR $fpath)
autoload -Uz $ZFUNCDIR/*(.:t)

# Load Zsh completion styles
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Initialize antidote plugin manager
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# Load antidote and plugins
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

# Set Zsh history options
setopt histignoredups
setopt sharehistory

# Source configuration files
for _rc in ${ZDOTDIR:-$HOME}/.zshrc.d/*.zsh; do
    # Skip backup files
    if [[ $_rc:t != '~'* ]]; then
        source "$_rc"
    fi
done
unset _rc


# Initialize completion system
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

# Initialize and set prompt
autoload -Uz promptinit && promptinit
prompt pure
