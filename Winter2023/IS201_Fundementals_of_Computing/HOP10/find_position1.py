# Author    : Blake Kucera
# Class     : IS201
# Assignment: HOP10

import pyautogui
import time

screenWidth, screenHeight = pyautogui.size()
currentMouseX, currentMouseY = pyautogui.position()
print("Starting Position: ({}, {})".format(currentMouseX, currentMouseY))
pyautogui.moveTo(588, 482)
pyautogui.click()
for i in range(10):
    time.sleep(1)
    currentMouseX, currentMouseY = pyautogui.position()
    print("New Position({}): ({}, {})".format(i, currentMouseX, currentMouseY))