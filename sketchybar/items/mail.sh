#!/bin/bash

mail_item=(
    update_freq=180
    icon.font="$FONT:bold:15.0"
    icon=$MAIL
    icon.color=$BLUE
    label=$LOADING
    label.highlight_color=$BLUE
    script="$PLUGIN_DIR/mail.sh"
)

sketchybar --add item mail.count right \
    --set mail.count "${mail_item[@]}"
