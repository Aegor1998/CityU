# Author    : Blake Kucera
# Class     : IS201
# Assignment: PE07

class Restraunt:
    def __init__(self, name, cuisine, open):
        self.name = str(name)
        self.cuisine = str(cuisine)
        self.open = bool(open)

    def describe_Restraunt(self):
        openClosed = None
        if self.open:
            openClosed = "Open"
        else:
            openClosed = "Closed"
        print("{} serves {} food and is {}".format(self.name,
                                                   self.cuisine, openClosed))

    def is_Open(self):
        match self.open:
            case False:
                print("Currently closed")
            case True:
                print("Currently Open")


object1 = Restraunt("McDonalds", "American FastFood", True)
object2 = Restraunt("Denny's", "American Dinner", True)
object3 = Restraunt("Applebees", "American", False)

object1.describe_Restraunt()
object1.is_Open()

object2.describe_Restraunt()
object2.is_Open()

object3.describe_Restraunt()
object3.is_Open()
