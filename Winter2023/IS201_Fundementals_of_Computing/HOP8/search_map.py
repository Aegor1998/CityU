# Author    : Blake Kucera
# Class     : IS201
# Assignment: HOP08

import webbrowser
import sys

place = 'city university of seattle'
if len(sys.argv) > 1:
    # Get address from cli
    place = ''.join(sys.argv[1:])

# This brings up a maps search for the addres input into place
webbrowser.open("http://google.com/maps/search/" + place)
