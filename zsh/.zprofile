#! /bin/zsh

# Browser
if [[ "$OSTYPE" == darwin* ]]; then
    export BROWSER="${BROWSER:-open}"
fi

# Editors
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-less}"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Paths
typeset -gU path fpath

# Add local builds to PATH
[[ -d "$HOME/Developer/bin" ]] && path=("$HOME/Developer/bin" $path)

path=(
    $HOME/{,s}bin(N)
    /opt/{homebrew,local}/{,s}bin(N)
    /usr/local/{,s}bin(N)
    $path
)

# Ripgrep configuration
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"

# FZF
if (( $+commands[fzf] )); then
    # Define Evergarden theme colors
    typeset -gA EVERGARDEN=(
        FG      '#D5D6C8'  # Default foreground
        BG      '#232A2E'  # Default background
        BG_ALT  '#3F4D52'  # Alternative background
        YELLOW  '#DBBC7F'  # Highlights
        GREEN   '#B2C98F'  # Selected highlights
        SAGE    '#93C9A1'  # Prompt
        RED     '#E67E80'  # Pointer
        PURPLE  '#E3A8D1'  # Marker
        BLUE    '#9BB5CF'  # Spinner
    )

    # Configure FZF options
    export FZF_DEFAULT_OPTS="
    --height 40%
    --layout=reverse
    --border
    --color=fg:${EVERGARDEN[FG]},bg:${EVERGARDEN[BG]},hl:${EVERGARDEN[YELLOW]}
    --color=fg+:${EVERGARDEN[FG]},bg+:${EVERGARDEN[BG_ALT]},hl+:${EVERGARDEN[GREEN]}
    --color=info:${EVERGARDEN[FG]},prompt:${EVERGARDEN[SAGE]},pointer:${EVERGARDEN[RED]}
    --color=marker:${EVERGARDEN[PURPLE]},spinner:${EVERGARDEN[BLUE]},header:${EVERGARDEN[FG]}
    "

    # Set default command for file search
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
fi

# Language
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Less
export LESS='-F -g -i -M -R -S -w -X -z-4'
export LESSHISTFILE="$HOME/.cache/less/history"

# Temporary Files
if [[ -d "$TMPDIR" ]]; then
    export TMPPREFIX="${TMPDIR%/}/zsh"
    if [[ ! -d "$TMPPREFIX" ]]; then
        mkdir -p "$TMPPREFIX"
    fi
fi
