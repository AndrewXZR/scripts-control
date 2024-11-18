#!/bin/sh

get_touchpad_name() {
    local touchpad
    touchpad=$(xinput list --name-only | grep -i touchpad | head -n 1)

    # If it contains ∼, we remove it
    if echo "$touchpad" | grep -q '∼'; then
        touchpad=$(echo "$touchpad" | sed 's/∼ //')
    fi

    echo "$touchpad"
}

toggle_touchpad() {
    local touchpad="$1"
    local state

    # Get touchpad status
    state=$(xinput list-props "$touchpad" | grep 'Device Enabled' | awk '{print $NF}')

    if [ "$state" -eq 1 ]; then
        xinput --disable "$touchpad" && notify-send -t 3000 --replace-id=1 -i "input-touchpad" "Touchpad" "Disabled"
    elif [ "$state" -eq 0 ]; then
        xinput enable "$touchpad" && notify-send -t 3000 --replace-id=1 -i "input-touchpad" "Touchpad" "Enabled"
    else
        notify-send -t 3000 --replace-id=1 -i "input-touchpad" "Touchpad" "Unknown state: $state"
    fi
}

main() {
    local touchpad
    touchpad=$(get_touchpad_name)

    if [ -z "$touchpad" ]; then
        notify-send -t 3000 --replace-id=1 -i "input-touchpad" "Touchpad" "Not found"
        exit 1
    fi

    toggle_touchpad "$touchpad"
}

main
