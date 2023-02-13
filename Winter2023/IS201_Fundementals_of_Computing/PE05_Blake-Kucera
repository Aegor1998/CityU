#!/usr/bin/env python3

# Author    : Blake Kucera
# Class     : IS201
# Assignment: PE05

import string


def make_shirt(size="L", message="I love python"):
    # None has to be passed for user input
    if size is None:
        size = get_size()
    # Not Really needed, but I like having so the top and bottom
    # look the same.
    if message is None:
        message = get_message()
    print("Size:", size, "\nMessage:", message)
    return size, message


def get_size():
    # No error checking to check is the if Size is a valid letter
    size = input("What is your shirt size(S/M/L): ")
    if not size.isalnum():
        print("That is not a letter. Please try again.")
        make_shirt()
    size = size.upper()
    return size


def get_message():
    message = input("What message do you want on the shirt: ")
    return message


def describe_city(city=None, country="USA"):
    # None has to be passed for user input
    if city is None:
        city = get_city()
    if country is None:
        country = get_country()
    print(city, "is in", country)


def get_city():
    city = input("Name of city: ")
    if not city.isalpha():
        print("Please use only Roman characters")
        get_city()
    return city[0].upper() + city[1:]


def get_country():
    country = input("Name of country: ")
    if not country.isalpha():
        print("Please use only Roman characters")
        get_country()
    return country[0].upper() + country[1:]


def show_messages(messages):
    for i in messages:
        messages = i
        print(messages, "\n")


def number_upper_lower(sentence="The quick Brow Fox"):
    upper = 0
    lower = 0
    for i in sentence:
        if i.isupper():
            upper = upper + 1
        if i.islower():
            lower = lower + 1
    return upper, lower


def main():
    # Part 1
    make_shirt(None, None)
    make_shirt("L", "Large is large")
    make_shirt(message="Small is small", size="M")
    # Part 2
    make_shirt()
    make_shirt("M")
    make_shirt("S")
    # Part 3
    describe_city(city="Arlington")
    describe_city(city="Chicago")
    describe_city(city="Tokyo", country="Japan")
    # Part 4
    messages = ("The dog is in the kenal",
                "The bird in on the table",
                "The car is in the air",
                "The door is in the oven")
    show_messages(messages)
    # Part 5
    upper, lower = number_upper_lower()
    print("No. of Upper Case Characters:", upper, "\n")
    print("No. of Lower Case Characters:", lower)


if __name__ == '__main__':
    main()
