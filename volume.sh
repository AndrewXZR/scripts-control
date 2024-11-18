#!/bin/bash

# Check if the argument is valid
if [[ "$1" != "up" && "$1" != "down" && "$1" != "mute" ]]; then
    notify-send -t 3000 --replace-id=1 -i dialog-error "Volume" "Usage: $0 [up|down|mute]"
    exit 1
fi

# Adjust the volume or toggle mute based on the argument
if [[ "$1" == "up" ]]; then
    amixer set Master 5%+ unmute > /dev/null
elif [[ "$1" == "down" ]]; then
    amixer set Master 5%- unmute > /dev/null
elif [[ "$1" == "mute" ]]; then
    amixer set Master toggle > /dev/null
fi

# Get the current volume and mute status
VOLUME=$(amixer get Master | grep -oP '\d+%' | head -1)
MUTE_STATUS=$(amixer get Master | grep '\[on\]' &> /dev/null && echo "Unmuted" || echo "Muted")

# Set the icon based on the mute status
ICON="audio-volume-high"
[[ "$MUTE_STATUS" == "Muted" ]] && ICON="audio-volume-muted"

# Show a notification with the current volume and mute status
notify-send -t 3000 --replace-id=1 -i "$ICON" "Volume" "$MUTE_STATUS - $VOLUME"