# Author    : Blake Kucera
# Class     : IS201
# Assignment: HOP07

class Dog:
    # class attribute
    species = 'mammal'

    def __int__(self, name, age):
        self.name = name
        self.age = age

    def description(self):
        return "{} is {} years old.".format(self.name, self.age)

    def speak(self, sound):
        return "{} says {}".format(self.name, sound)


class RussellTerrier(Dog):
    def run(self, speed):
        return "{} runs{}.".format(self.name, speed)


class Bulldog(Dog):
    def run(self, speed):
        return "{} runs {}".format(self.name, speed)


#jim = Bulldog("Jim", 12) #TypeError: Bulldog() takes no arguments
jim = Bulldog()
jim.name = "Jim"
jim.age = 12
print(jim.description)

print(jim.run("slowly"))
