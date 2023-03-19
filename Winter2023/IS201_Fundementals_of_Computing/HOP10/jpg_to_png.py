# Author    : Blake Kucera
# Class     : IS201
# Assignment: HOP10

from PIL import Image

img = Image.open('./bulldog.jpg')

width, height = img.size

print("Width: {}, Height: {}".format(width, height))

if img.format == "JPEG":
    img.save('bulldog2.png')
