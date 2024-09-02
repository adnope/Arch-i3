#!/bin/bash

# Turning on Natural Scrolling and Tap to click for my touchpad

touchpad_id=$(xinput | grep 'Touchpad' | awk '{print $6}' | awk '{print substr($0,length($0)-1,2)}')

xinput set-prop "$touchpad_id" "libinput Natural Scrolling Enabled" 1
xinput set-prop "$touchpad_id" "libinput Tapping Enabled" 1
