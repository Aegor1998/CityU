#!/usr/bin/env python3

# Author    : Blake Kucera
# Class     : IS201
# Assignment: HOP05

file = open('hello.txt', 'a')
file.write('\nThis is new content I just appended')
file.close()

new_file = open('world.txt', 'w')
new_file.write('This is new file')
new_file.close()

file = open('hello.txt')
contents = file.read()
file.close()
print(contents)


