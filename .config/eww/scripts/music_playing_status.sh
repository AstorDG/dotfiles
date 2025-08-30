#!/bin/bash

STATUS="$(playerctl --player=spotify status 2>/dev/null)"

if [ "$STATUS" = "Playing" ]; then
    echo ""
else 
    echo "󰏦"
fi
