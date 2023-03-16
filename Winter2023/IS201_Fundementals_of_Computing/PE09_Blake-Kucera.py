# Author    : Blake Kucera
# Class     : IS201
# Assignment: PE09


# Part 1 :Extract all the links from this website https://news.ycombinator.com/news
# using what you have learned earlier as the output shown below by extracting “titles”
# and “links”.

import requests
from bs4 import BeautifulSoup

url = "https://news.ycombinator.com/news"

response = requests.get(url)

soup = BeautifulSoup(response.content, 'html.parser')
links = []
# Print the href attribute and text of each link
for link in soup.find_all('a'):
    links.append(link.get('href', 'http'))
print(links)

# Find all the titles on the page
titles = soup.find_all('title')

# Print the text of each title
for title in titles:
    print(title.get_text())

