#!/usr/bin/python3

# Auto move the cursor by one pixel every 5 minutes
# so that the system won't auto sleep when idling

import pyautogui
import time

while(True):
    pyautogui.moveRel(0, 1, 0)
    time.sleep(300)