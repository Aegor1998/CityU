# Author    : Blake Kucera
# Class     : IS201
# Assignment: HOP10

import pyautogui

print('Press CTRL + C to terminate')

try:
    while True:
        x, y = pyautogui.position()
        positionSTR = "X: {}, Y: {}".format(x,y)
        print(positionSTR, end='\r')
except KeyboardInterrupt:
    print('\nDone')
