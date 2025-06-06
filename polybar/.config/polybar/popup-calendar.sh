#!/bin/sh

BAR_HEIGHT=12  # polybar height
BORDER_SIZE=2  # border size from your wm settings
YAD_WIDTH=250  # 222 is minimum possible value
YAD_HEIGHT=200 # 193 is minimum possible value
DATE="$(date +"%A, %b %e - %H:%M:%S %p")"

case "$1" in
--popup)
    if [ "$(xdotool getwindowfocus getwindowname)" = "yad-calendar" ]; then
        exit 0
    fi

    eval "$(xdotool getmouselocation --shell)"
    eval "$(xdotool getdisplaygeometry --shell)"

    # # X
    # if [ "$((X + YAD_WIDTH / 2 + BORDER_SIZE))" -gt "$WIDTH" ]; then #Right side
    #     : $((pos_x = WIDTH - YAD_WIDTH - BORDER_SIZE))
    # elif [ "$((X - YAD_WIDTH / 2 - BORDER_SIZE))" -lt 0 ]; then #Left side
    #     : $((pos_x = BORDER_SIZE))
    # else #Center
    #     : $((pos_x = X - YAD_WIDTH / 2))
    # fi

    # # Y
    # if [ "$Y" -gt "$((HEIGHT / 2))" ]; then #Bottom
    #     : $((pos_y = HEIGHT - YAD_HEIGHT - BAR_HEIGHT - BORDER_SIZE))
    # else #Top
    #     : $((pos_y = BAR_HEIGHT + BORDER_SIZE))
    # fi

     # Center horizontally
    : $((pos_x = (WIDTH - YAD_WIDTH) / 2))

    # Y position based on mouse Y
    if [ "$Y" -gt "$((HEIGHT / 2))" ]; then # Bottom half of screen
        : $((pos_y = HEIGHT - YAD_HEIGHT - BAR_HEIGHT - BORDER_SIZE))
    else # Top half of screen
        : $((pos_y = BAR_HEIGHT + BORDER_SIZE))
    fi

    yad --calendar --undecorated --close-on-unfocus --fixed --no-buttons \
        --width="$YAD_WIDTH" --height="$YAD_HEIGHT" --posx="$pos_x" --posy="$pos_y" \
        --fontname="JetbrainsMono Nerd Font 14" \
        --title="yad-calendar" --borders=0 >/dev/null &
    ;;
*)
    echo "$DATE"
    ;;
esac
