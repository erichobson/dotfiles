#!/bin/zsh

# Disable highlighting on paste
zle_highlight=(paste:none)

# Configure syntax highlighting colors using Evergarden theme
typeset -A ZSH_HIGHLIGHT_STYLES

# Main highlighting styles
ZSH_HIGHLIGHT_STYLES[default]='fg=#D5D6C8'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#E67E80'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#E3A8D1'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#93C9A1'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#93C9A1'
ZSH_HIGHLIGHT_STYLES[function]='fg=#93C9A1'
ZSH_HIGHLIGHT_STYLES[command]='fg=#B2C98F'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#B2C98F,italic'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#9BB5CF'
ZSH_HIGHLIGHT_STYLES[path]='fg=#9BB5CF'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#9BB5CF'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#DBBC7F'

# Pattern highlighting styles
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#E69875'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#E69875'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#E69875'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#E69875'

# Other syntax elements
ZSH_HIGHLIGHT_STYLES[comment]='fg=#94AAA0'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=#B2C98F'

# Adjust autosuggest colour
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#94AAA0'

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=none,fg=#93C9A1'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=none,fg=#E67E80'
