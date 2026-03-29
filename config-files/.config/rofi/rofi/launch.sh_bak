#!/bin/bash

# Check if rofi is running
if pgrep -x "rofi" > /dev/null; then
    # Kill all running instances
    pkill -x "rofi"
else
    # Launch rofi
    rofi -show drun &
fi
