#!/bin/bash

# 1. Toggle Logic
if pgrep -x "rofi" > /dev/null; then
    pkill -x "rofi"
    exit 0
fi

# 2. Launch Rofi in drun mode, intercept Enter to check for URLs
rofi -show drun -theme arthur -run-command 'bash -c "
    CMD=\"{cmd}\"
    URL_REGEX=\"^([a-zA-Z0-9](([a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}(/.*)?|https?://[a-zA-Z0-9.-]+)\"
    if [[ \"\$CMD\" =~ \$URL_REGEX ]]; then
        if [[ ! \"\$CMD\" =~ ^https?:// ]]; then
            xdg-open \"https://\$CMD\"
        else
            xdg-open \"\$CMD\"
        fi
    else
        {cmd}
    fi
"'
