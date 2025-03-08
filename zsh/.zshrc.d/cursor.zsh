#!/bin/zsh

# Define cursor styles
typeset -gA CURSOR_STYLE=(
    BEAM  '\e[6 q'  # Solid beam for insert mode
    BLOCK '\e[2 q'  # Solid block for normal mode
)

# Cursor style configuration for vi mode
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne ${CURSOR_STYLE[BLOCK]}
    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ $1 = 'beam' ]]; then
        echo -ne ${CURSOR_STYLE[BEAM]}
    fi
}

# Initialize line with insert mode and beam cursor
function zle-line-init {
    zle -K viins
    echo -ne ${CURSOR_STYLE[BEAM]}
}

# Enable vi mode
bindkey -v

# Register ZLE widgets
zle -N zle-keymap-select
zle -N zle-line-init

# Initialize cursor as beam (insert mode)
echo -ne ${CURSOR_STYLE[BEAM]}
