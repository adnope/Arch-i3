#!/bin/bash

# Check if an argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 [1|2|3]"
    echo "1 = PCI sink, 2 = USB sink, 3 = Bluetooth sink"
    exit 1
fi

# Determine the keyword based on the argument
case "$1" in
    1)
        keyword="pci"
        ;;
    2)
        keyword="usb"
        ;;
    3)
        keyword="bluez"
        ;;
    *)
        echo "Invalid argument. Use '1' for PCI, '2' for USB, or '3' for Bluetooth."
        exit 1
        ;;
esac

# Find the sink with the specified keyword in its name
sink=$(pactl list sinks short | grep "$keyword" | awk '{print $1}')

# Check if a sink was found and set it as the default
if [ -n "$sink" ]; then
    pactl set-default-sink "$sink"
    echo "Set $keyword sink (ID: $sink) as the default sink."
else
    echo "No $keyword sink found."
fi
