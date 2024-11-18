#!/bin/bash

# Validate entry
if [[ "$1" != "up" && "$1" != "down" ]]; then
    echo "Uso: $0 [up|down]"
    exit 1
fi

# Brightness adjustment steps
STEP=10

# Get current brightness
CURRENT_BRIGHTNESS=$(cat "$BRIGHTNESS_FILE")

# new brightness
if [[ "$1" == "up" ]]; then
    light -A $STEP
else
    light -U $STEP
fi

# Notify the change
notify-send -t 3000 --replace-id=1 -i display-brightness "Brightness" "Adjusted to $(light -G | xargs printf "%.0f\n")%"