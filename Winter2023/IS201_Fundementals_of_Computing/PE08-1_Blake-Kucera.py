# Author    : Blake Kucera
# Class     : IS201
# Assignment: PE08

import math


class Shape():
    def __init__(self):
        pass


class Rectangle(Shape):
    def __init__(self):
        self.side_lengths = [5, 4]  # x, y

    # task: return number of sides
    def getEdges(self):
        return len(self.side_lengths) * 2

    # task: return computed perimeter
    def computePerimeter(self):
        return sum(self.side_lengths) * 2

    # task: return the area of the rectangle
    def computeArea(self):
        return self.side_lengths[0] * self.side_lengths[1]


class Triangle(Shape):
    def __init__(self):
        self.side_lengths = [3, 6, 7]  # 3 sides

    # task: return number of sides
    def getEdges(self):
        return len(self.side_lengths)

    # task: return computed perimeter
    def computePerimeter(self):
        return sum(self.side_lengths)

    # task: return the area of the rectangle
    def computeArea(self):
        sP = self.computePerimeter() / 2
        res = sP
        for n in self.side_lengths:
            res = res * (sP - n)
        return math.sqrt(res)


# creating objects for rectangle and triangle
r = Rectangle()
t = Triangle()

# calling its methods to print the # of sides, perimeter and the area.
print(r.getEdges())
print(r.computePerimeter())
print(r.computeArea())

print(t.getEdges())
print(t.computePerimeter())
print(t.computeArea())
