#!/bin/bash

WALLPAPER_PATH="$1"

if [ -z "$WALLPAPER_PATH" ]; then
  echo "Usage: $0 /path/to/wallpaper.jpg"
  exit 1
fi

# Check if the file exists
if [ ! -f "$WALLPAPER_PATH" ]; then
  echo "Error: File not found - $WALLPAPER_PATH"
  exit 1
fi

feh --bg-fill "$WALLPAPER_PATH"
sed -i "3s|.*|wallpaper=$WALLPAPER_PATH|" "/home/adnope/.config/i3/set_wallpaper.sh"