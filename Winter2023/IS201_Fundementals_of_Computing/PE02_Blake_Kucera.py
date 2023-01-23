#!/usr/bin/env python3

# Author: Blake Kucera
# Created: 01/17/2023 1054
# Purpose:
# 1) Write an if-elif-else chain that determines a person's stage of life. Set a value for the variable age, and then
    # If the person is less than 2 years old, print a message saying that they are a baby
    # If the person is 2 <= x > 4, print that they are a toddler
    # If the person is 4 <= x > 13, print that the user is a kid
    # If the person is 13 <= x < 20, print that the user is a teenager
    # If the person is 20 <= x < 65, print that the user is an adult
    # If the person is x >= 65, print that the user is an elder
# 2) A movie theater charges different ticket prices depending on a person's age.
    # If a person is under the age of 3, the ticket is free
    # If the person is 3 <= x <= 12, the ticket is $10
    # If the person is x > 12, the ticket is $15
    # Write a loop that asks the user their age and then tells them the cost of their movie ticket
# 3) Write a python program that takes one integer number at a time continuously from a user and halts its execution
    # when the sum of the input is greater than 25
    # Need to email the TA to ask about part 3 as it is out of place

# Satisfies Part 1
def cateAge(age):
    category = ""
    if age >= 65:
        category = "elder"
    elif age >= 20:
        category = "adult"
    elif age >= 13:
        category = "teenager"
    elif age >= 4:
        category = "kid"
    elif age >= 2:
        category = "toddler"
    else:
        category = "baby"
    return category


def userAge():
    age = input("What is your age: ")
    # Error Handling for user input
    if not str.isdigit(age):
        print("Please input an integer.\n")
        userAge()
    age = int(age)
    category = cateAge(age)
    print("\nYou are a ", category, ".\n")
    return age

# Satisfies Part 2
def getTicketPrice(age):
    ticket = None
    if age > 12:
        ticket = 15
    elif age >= 3:
        ticket = 10
    else:
        ticket = 0
    return ticket


def ticketInfo(age):
    price = getTicketPrice(age)
    print("\nGive that you are ", age, " your ticket price is $", price, "\n")

# Satisfies Part 3
def countToTwentyFive(counter = 0):
    while counter <= 25:
        userInput = input("Please input a number: ")

        if not str.isdigit(userInput):
            print("Please input an integer.\n")
            countToTwentyFive(counter)

        counter += int(userInput)
        print("Current Value: ", counter)


def main():
    print("Part 1: Person's Stage of Life")
    age = userAge()

    print("Part 2: Cost of a ticket")
    print("Your ticket costs $", getTicketPrice(age), ".")

    print("Part 3: Add user input")
    countToTwentyFive()

    return 0


if __name__ == '__main__':
    main()
