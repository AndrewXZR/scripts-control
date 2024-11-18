#!/bin/bash

# Validate entry
if [[ "$1" != "up" && "$1" != "down" ]]; then
    echo "Uso: $0 [up|down]"
    exit 1
fi

# Path to the brightness file
BRIGHTNESS_FILE="/sys/class/backlight/intel_backlight/brightness"

# Getting maximum brightness
MAX_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/max_brightness)

# Brightness adjustment steps
STEP=1000

# Get current brightness
CURRENT_BRIGHTNESS=$(cat "$BRIGHTNESS_FILE")

# Calculate the new brightness
if [[ "$1" == "up" ]]; then
    NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS + STEP))
else
    NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS - STEP))
fi

# Limit brightness between 0 and MAX_BRIGHTNESS
NEW_BRIGHTNESS=$(($NEW_BRIGHTNESS < 0 ? 0 : $NEW_BRIGHTNESS))
NEW_BRIGHTNESS=$(($NEW_BRIGHTNESS > $MAX_BRIGHTNESS ? $MAX_BRIGHTNESS : $NEW_BRIGHTNESS))

# Apply the new gloss
echo $NEW_BRIGHTNESS | sudo tee "$BRIGHTNESS_FILE" > /dev/null

# Notify the change
notify-send -t 3000 --replace-id=1 -i display-brightness "Brightness" "Adjusted to $((NEW_BRIGHTNESS * 100 / MAX_BRIGHTNESS))%"