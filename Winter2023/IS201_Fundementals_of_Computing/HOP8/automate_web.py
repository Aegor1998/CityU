# Author    : Blake Kucera
# Class     : IS201
# Assignment: HOP08

from selenium import webdriver

browser = webdriver.Firefox

browser.get("https://accounts.google.com/signup")
firstname = browser.find_element_by_id('firstname')
firstname.send_key('Thomas')
lastname = browser.find_element_by_id('lastname')
lastname.send_key('Anderson')
username = browser.find_element_by_id('username')
username.send_key('Neo')
passwd = browser.find_element_by_id('Passwd')
passwd.send_key('noPassword')
passwd = browser.find_element_by_id('ConfirmPasswd')
passwd.send_key('noPassword')
