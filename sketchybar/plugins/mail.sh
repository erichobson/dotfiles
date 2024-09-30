#!/bin/bash

# Function to get the number of unread emails from the default Mail app
get_unread_count() {
    osascript -e 'tell application "Mail" to return the unread count of inbox'
}

# Get the unread count
unread=$(get_unread_count)

# Update the sketchybar item
sketchybar --set mail.count label="$unread"
