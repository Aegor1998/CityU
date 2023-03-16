# *****************************************************************************
# NAME: Trevor Sparks and Blake Kucera
# GROUP: Blake and Trevor
# PURPOSE: Tic-Tac-Toe written in Python that utilizes a minimax algorithm to
# challenge the player.
# ASSIGNMENT: TP03
# *****************************************************************************
# Functions
def getMove(row=None, col=None):
    if row is None:
        row = int(input("Row: "))
        if row < 0 or row > 2:
            print("Row is out of range(0:2)")
            row, col = getMove()
    if col is None:
        col = int(input("Column: "))
        if col < 0 or col > 2:
            print("Column is out of range(0:2)")
            _, col = getMove(row)
    return row, col


def makeTurn(board, player):
    row, col = getMove()
    board.updateGrid(self=board, row=row, col=col, symbol=player.symbol)
    return board


# Custom Errors
class NotEmpty(Exception):
    print("This Position is not empty")


# Declaring Class
class Board:

    def __init__(self, grid) -> None:
        # The play board
        self.grid = grid

    def newBoard(self):
        self.grid = [["_", "_", "_"],
                     ["_", "_", "_"],
                     ["_", "_", "_"]]

    def show(self):
        for i in range(3):
            row = "| "
            for j in range(3):
                row += self.grid[i][j] + " | "
            print(row)
        print("_____________")

    def updateGrid(self, row, col, symbol):
        if self.grid[row][col] == "_":
            self.grid[row][col] = symbol
        else:
            raise NotEmpty

    def checkWin(self):
        # Check each row
        for row in self:
            if row.count("X") == 3:
                return "X"
            elif row.count("O") == 3:
                return "O"
            else:
                pass
        # Check each col
        column = list(zip(*self))
        for row in column:
            if row.count("X") == 3:
                return "X"
            elif row.count("O") == 3:
                return "O"
            else:
                pass
        # Check diagonal 1
        diagLeft = [self[0][0], self[1][1], self[2][2]]
        for row in diagLeft:
            if row.count("X") == 3:
                return "X"
            elif row.count("O") == 3:
                return "O"
            else:
                pass
        # Check diagonal 2
        diagRight = [self[0][2], self[1][1], self[2][0]]
        for row in diagRight:
            if row.count("X") == 3:
                return "X"
            elif row.count("O") == 3:
                return "O"
            else:
                pass


class Player:
    def __init__(self, symbol, turn):
        self.symbol = symbol  # Will be X or O
        self.turn = turn

    def getSymbol(self):
        self.symbol = input("What is your symbol(X/O)")
        self.symbol = self.symbol.upper()


# TESTING
def TestModule():
    testBoard = BoardTests()
    testPlayer = PlayerTests()
    # row, col = getMove(board=testBoard)
    testBoard = makeTurn(board=testBoard, player=testPlayer)
    testBoard.show(testBoard)


def BoardTests():
    testBoard = Board
    testBoard.newBoard(testBoard)
    testBoard.show(testBoard)
    testBoard.updateGrid(testBoard, row=0, col=0, symbol="X")
    testBoard.show(testBoard)
    return testBoard


def PlayerTests():
    testPlayer = Player
    testPlayer.getSymbol(testPlayer)
    print(testPlayer.symbol)
    return testPlayer


def main():
    TestModule()


# sets main() to run
if __name__ == "__main__":
    main()
