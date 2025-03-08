#!/bin/zsh

# Pure prompt configuration using Evergarden theme colors

# Define Evergarden colors
typeset -gA PURE_COLORS=(
    BLUE    '#9BB5CF'   # Sapphire
    GREEN   '#B2C98F'   # Green
    RED     '#E67E80'   # Red
    GRAY    '#94AAA0'   # Overlay2
    TEAL    '#93C9A1'   # Teal
    PEACH   '#E69875'   # Peach
    YELLOW  '#DBBC7F'   # Yellow
    MAUVE   '#D6A0D1'   # Mauve/Lavender
    SKY     '#97C9C3'   # Sky
    SURFACE '#46565B'   # Surface2
)

#
# Prompt Elements
#

# Main prompt elements
zstyle :prompt:pure:path color "${PURE_COLORS[BLUE]}"           # Directory path
zstyle :prompt:pure:prompt:success color "${PURE_COLORS[GREEN]}" # Success indicator
zstyle :prompt:pure:prompt:error color "${PURE_COLORS[RED]}"    # Error indicator
zstyle :prompt:pure:prompt:continuation color "${PURE_COLORS[GRAY]}" # Line continuation

# Git status elements
zstyle :prompt:pure:git:branch color "${PURE_COLORS[TEAL]}"     # Branch name
zstyle :prompt:pure:git:dirty color "${PURE_COLORS[PEACH]}"     # Dirty state
zstyle :prompt:pure:git:arrow color "${PURE_COLORS[YELLOW]}"    # Arrows
zstyle :prompt:pure:git:stash color "${PURE_COLORS[MAUVE]}"     # Stash indicator
zstyle :prompt:pure:git:upstream color "${PURE_COLORS[SKY]}"    # Upstream status
zstyle :prompt:pure:git:fetch yes                               # Enable fetch

# User and host information
zstyle :prompt:pure:user:root color "${PURE_COLORS[RED]}"       # Root user
zstyle :prompt:pure:user color "${PURE_COLORS[MAUVE]}"         # Normal user
zstyle :prompt:pure:host color "${PURE_COLORS[TEAL]}"          # Hostname

# Additional elements
zstyle :prompt:pure:virtualenv color "${PURE_COLORS[SKY]}"      # Python virtualenv
zstyle :prompt:pure:execution_time color "${PURE_COLORS[GRAY]}" # Command duration

#
# Prompt Appearance
#

# Execution time threshold (seconds)
PURE_CMD_MAX_EXEC_TIME=1

# Prompt symbols
PURE_PROMPT_SYMBOL='❯'
PURE_PROMPT_VICMD_SYMBOL='❮'
PURE_PROMPT_PAD_DIVIDER='·'

# Prompt padding
zstyle :prompt:pure:prompt:pad divider $PURE_PROMPT_PAD_DIVIDER
zstyle :prompt:pure:prompt divider_color "${PURE_COLORS[SURFACE]}"
