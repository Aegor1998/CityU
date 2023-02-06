# Author: Blake Kucera
# Class: CS201
# Assignment: E04 Dictionary, string and set
import random
import string
from random import randint


def partOne():
    dic1 = {1: 10, 2: 20}
    dic2 = {3: 30, 4: 40}
    dic3 = {5: 50, 6: 60}
    newDic = {}
    newDic.update(dic1)
    newDic.update(dic2)
    newDic.update(dic3)
    print(newDic)


def partTwo(number):
    generatedDict = {}
    for i in range(number + 1):
        if i > 0:
            generatedDict[i] = i * i
    print(generatedDict)


def partThree():
    d1 = {'a': 100, 'b': 200, 'c': 300}
    d2 = {'a': 300, 'b': 200, 'd': 400}
    keys = ('a', 'b', 'c', 'd')
    Counter = {}
    for i in keys:
        if i in d1.keys() and i in d2.keys():
            Counter[i] = d1[i] + d2[i]
        elif i in d1.keys():
            Counter[i] = d1[i]
        elif i in d2.keys():
            Counter[i] = d2[i]
        else:
            print("Key ", i, " is out of bounds")
    print(Counter)


def partFour():
    JohnFriends = ["Jason", "Kim", "Allison", "Kevin", "Lisa"]
    KimFriends = ["John", "Allison", "Lily", "Sam", "Sharon"]
    commonFriends = []
    for i in JohnFriends:
        if i in KimFriends:
            commonFriends.append(i)
    print(commonFriends)


def partFive():
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    letters = list(string.ascii_lowercase)
    randomLetter = []
    while len(randomLetter) < 5:
        randomLetter.append(randint(0, 25))
    randomInt = []
    while len(randomInt) < 2:
        randomInt.append(randint(0, 9))
    password = [str(numbers[randomInt[0]]), str(numbers[randomInt[1]]), letters[randomLetter[0]],
                letters[randomLetter[1]], letters[randomLetter[2]], letters[randomLetter[3]].upper(),
                letters[randomLetter[4]].upper()]

    random.shuffle(password)
    password = "".join(password)
    print(password)


def main():
    partOne()
    partTwo(5)
    partThree()
    partFour()
    partFive()


if __name__ == "__main__":
    main()
