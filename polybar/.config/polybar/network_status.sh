#!/bin/bash

calculate_speed() {
    local RX_BYTES_1 TX_BYTES_1 RX_BYTES_2 TX_BYTES_2
    local RX_RATE_KB TX_RATE_KB RX_RATE_MB TX_RATE_MB

    RX_BYTES_1=$(cat /sys/class/net/"$INTERFACE"/statistics/rx_bytes)
    TX_BYTES_1=$(cat /sys/class/net/"$INTERFACE"/statistics/tx_bytes)
    sleep 1
    RX_BYTES_2=$(cat /sys/class/net/"$INTERFACE"/statistics/rx_bytes)
    TX_BYTES_2=$(cat /sys/class/net/"$INTERFACE"/statistics/tx_bytes)
    
    RX_RATE_KB=$(( (RX_BYTES_2 - RX_BYTES_1) / 1024 ))
    TX_RATE_KB=$(( (TX_BYTES_2 - TX_BYTES_1) / 1024 ))
    
    if [ "$RX_RATE_KB" -ge 1000 ]; then
        RX_RATE_MB=$(awk "BEGIN { printf \"%.2f\", $RX_RATE_KB / 1024 }")
        RX_RATE="${RX_RATE_MB} MB/s"
    else
        RX_RATE="${RX_RATE_KB} KB/s"
    fi

    if [ "$TX_RATE_KB" -ge 1000 ]; then
        TX_RATE_MB=$(awk "BEGIN { printf \"%.2f\", $TX_RATE_KB / 1024 }")
        TX_RATE="${TX_RATE_MB} MB/s"
    else
        TX_RATE="${TX_RATE_KB} KB/s"
    fi

    echo $ICON "  ${RX_RATE}  ${TX_RATE}"
}

# Get network status
NETWORK_STATUS=$(nmcli device status)
ETH_STATUS=$(echo "$NETWORK_STATUS" | grep -i 'ethernet' | awk '{print $3}')
WIFI_STATUS=$(echo "$NETWORK_STATUS" | grep -i 'wifi' | awk 'NR==1 {print $3}')

# Color and icon configuration
ICON_COLOR="%{F#7aa2f7}"
TEXT_COLOR="%{F#a9b1d6}"

ETH_ICON="$ICON_COLOR"󰈀"$TEXT_COLOR"
WIFI_ICON_1="$ICON_COLOR"󰤯"$TEXT_COLOR"
WIFI_ICON_2="$ICON_COLOR"󰤟"$TEXT_COLOR"
WIFI_ICON_3="$ICON_COLOR"󰤢"$TEXT_COLOR"
WIFI_ICON_4="$ICON_COLOR"󰤥"$TEXT_COLOR"
WIFI_ICON_5="$ICON_COLOR"󰤨"$TEXT_COLOR"

# Determine interface and icon
if [[ "$ETH_STATUS" == "connected" ]]; then
    INTERFACE=$(echo "$NETWORK_STATUS" | grep -i 'ethernet' | awk 'NR==1 {print $1}')
    ICON=$ETH_ICON
elif [[ "$WIFI_STATUS" == "connected" ]]; then
    INTERFACE=$(echo "$NETWORK_STATUS" | grep -i 'wifi' | awk 'NR==1 {print $1}')
    WIFI_SIGNAL=$(nmcli -f AP device show "$INTERFACE" | awk -F: '/IN-USE/ {in_use = $2} in_use ~ /\*/ && /SIGNAL/ {print $2}')
    
    # Assign appropriate Wi-Fi icon based on signal strength
    if [ "$WIFI_SIGNAL" -ge 80 ]; then
        ICON=$WIFI_ICON_5
    elif [ "$WIFI_SIGNAL" -ge 60 ]; then
        ICON=$WIFI_ICON_4
    elif [ "$WIFI_SIGNAL" -ge 40 ]; then
        ICON=$WIFI_ICON_3
    elif [ "$WIFI_SIGNAL" -ge 20 ]; then
        ICON=$WIFI_ICON_2
    else
        ICON=$WIFI_ICON_1
    fi
fi

# Check if INTERFACE is empty before calling calculate_speed
if [ -n "$INTERFACE" ]; then
    calculate_speed
else
    echo ""
fi
