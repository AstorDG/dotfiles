#!/usr/bin/env bash  
  
# List all AppImages in your directory  
APPIMAGE_DIR="$HOME/Appimages/"

find "$APPIMAGE_DIR" -name "*.AppImage" -executable

if [ -n "$1" ]; then  
    # Launch the selected AppImage in background  
    coproc ( "$1" > /dev/null 2>&1 )  
    exit 0
fi
 
