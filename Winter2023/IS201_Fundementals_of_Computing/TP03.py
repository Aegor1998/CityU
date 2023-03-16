# *****************************************************************************
# NAME: Trevor Sparks and Blake Kucera
# GROUP: Blake and Trevor
# PURPOSE: Tic-Tac-Toe written in Python that utilizes a minimax algorithm to
# challenge the player.
# ASSIGNMENT: TP03
# *****************************************************************************
# Functions

# Declaring Class
class Board:

    def __init__(self, grid) -> None:
        # The play board
        self.grid = [["_", "_", "_"],
                     ["_", "_", "_"],
                     ["_", "_", "_"]]

    def show(self):
        for _ in self.grid:
            print("\n|", end=" ")
        for i in _:
            print(i, "|", end=" ")


# TESTING
def TestModule():
    testBoard = Board
    testBoard.show()


def main():
    TestModule()


# sets main() to run
if __name__ == "__main__":
    main()
