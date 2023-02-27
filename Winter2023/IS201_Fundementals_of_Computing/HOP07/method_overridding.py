# Author    : Blake Kucera
# Class     : IS201
# Assignment: HOP07

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def displayData(self):
        print("In parent class displayData method: {}, {}"
              .format(self.name, self.age))


class Employee(Person):
    def __init__(self, name, age, id):
        super().__init__(name, age)
        self.empId = id

    def displayData(self):
        print("In parent class displayData method: {}, {}, {}"
              .format(self.name, self.age, self.empId))


person = Person('John', 40)
person.displayData()

emp = Employee(name='John', age=40, id='E005')
emp.displayData()
