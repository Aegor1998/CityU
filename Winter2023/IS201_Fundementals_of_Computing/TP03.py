# *****************************************************************************
# NAME: Trevor Sparks and Blake Kucera
# GROUP: Blake and Trevor
# PURPOSE: Tic-Tac-Toe written in Python that utilizes a minimax algorithm to
# challenge the player.
# ASSIGNMENT: TP03
# *****************************************************************************
# Imported Modules
from random import randint


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


def makeTurn(board, symbol, row=None, col=None):
    if row is None and col is None:
        row, col = getMove()
    try:
        board.updateGrid(self=board, row=row, col=col, symbol=symbol)
    except NotEmpty:
        print("Error: ", NotEmpty)
        row, col = makeTurn(board, symbol)
        board.updateGrid(self=board, row=row, col=col, symbol=symbol)
    record_turn(symbol=symbol, row=row, col=col)
    return board


# Record the turn
def record_turn(symbol, row, col):  # Var mark is redundant
    with open("logging.csv", "a") as logging:
        write = symbol + "," + str(row) + "," + str(col) + "\n"
        print("row = ", row)
        logging.write(write)  # mark -> self.mark


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
        for row in self.grid:
            if row.count("X") == 3:
                return "X"
            elif row.count("O") == 3:
                return "O"
            else:
                pass
        # Check each col
        column = list(zip(*self.grid))
        for row in column:
            if row.count("X") == 3:
                return "X"
            elif row.count("O") == 3:
                return "O"
            else:
                pass
        # Check diagonal 1
        diagLeft = [self.grid[0][0], self.grid[1][1], self.grid[2][2]]
        if diagLeft.count("X") == 3:
            return "X"
        elif diagLeft.count("O") == 3:
            return "O"
        else:
            pass
        # Check diagonal 2
        diagRight = [self.grid[0][2], self.grid[1][1], self.grid[2][0]]
        if diagRight.count("X") == 3:
            return "X"
        elif diagRight.count("O") == 3:
            return "O"
        else:
            pass


class Player:
    def __init__(self, symbol):
        self.symbol = symbol  # Will be X or O

    def getSymbol(self):
        self.symbol = input("What is your symbol(X/O)")
        self.symbol = self.symbol.upper()


class Computer(Player):
    def __init__(self, symbol):
        super().__init__(symbol)

    def setSymbol(self, player):
        if player.symbol == "X":
            self.symbol = "O"
        else:
            self.symbol = "X"

    # Makes a Random turn
    def ranTurn(self, board, row=None):
        while row is None or board.grid[row][col] != "_":
            row = randint(0, 2)
            col = randint(0, 2)
        makeTurn(board=board, symbol=self.symbol, row=row, col=col)
        return board


# TESTING
def TestModule():
    testBoard = BoardTests()
    testPlayer = PlayerTests()
    testComputer = ComputerTest(testPlayer)
    testBoard = makeTurn(board=testBoard, symbol=testPlayer.symbol)
    testBoard.show(testBoard)
    testBoard = testComputer.ranTurn(self=testComputer, board=testBoard)
    testBoard.show(testBoard)
    WinTest()


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


def ComputerTest(testPlayer):
    testComputer = Computer
    testComputer.setSymbol(self=testComputer, player=testPlayer)
    print(testComputer.symbol)
    return testComputer


def WinTest(testBoard=Board):
    # Row X
    testBoard.grid[0][0] = "X"
    testBoard.grid[0][1] = "X"
    testBoard.grid[0][2] = "X"
    testBoard.show(testBoard)
    print("X == ", testBoard.checkWin(self=testBoard))
    # Row O
    testBoard.grid[0][0] = "O"
    testBoard.grid[0][1] = "O"
    testBoard.grid[0][2] = "O"
    testBoard.show(testBoard)
    print("O == ", testBoard.checkWin(self=testBoard))
    # Col X
    testBoard = Board
    testBoard.grid[0][0] = "X"
    testBoard.grid[1][0] = "X"
    testBoard.grid[2][0] = "X"
    testBoard.show(testBoard)
    print("X == ", testBoard.checkWin(self=testBoard))
    # Col O
    testBoard.grid[0][0] = "O"
    testBoard.grid[1][0] = "O"
    testBoard.grid[2][0] = "O"
    testBoard.show(testBoard)
    print("O == ", testBoard.checkWin(self=testBoard))
    # Diag X
    testBoard = Board
    testBoard.grid[0][0] = "X"
    testBoard.grid[1][1] = "X"
    testBoard.grid[2][2] = "X"
    testBoard.show(testBoard)
    print("X == ", testBoard.checkWin(self=testBoard))
    # Diag O
    testBoard.grid[0][1] = "_"
    testBoard.grid[1][0] = "_"
    testBoard.grid[0][0] = "_"
    testBoard.grid[1][1] = "O"
    testBoard.grid[2][2] = "O"
    testBoard.show(testBoard)
    print("O == ", testBoard.checkWin(self=testBoard))


def main():
    # Uncomment to run tests
    # TestModule()
    # Win Condition
    win = None
    # Create Main Variables
    board = Board
    player = Player
    computer = Computer
    # Initialize Variables
    board.newBoard(board)
    player.getSymbol(player)
    computer.setSymbol(self=computer, player=player)
    # Displaying Empty Board
    board.show(board)
    # Turn Loop (MAX TURNS IS 9)
    # Using the convention that X goes first
    for i in range(9):
        print("Turn ", i)
        # This is how I decided to handle turns
        if player.symbol == "X":  # Player First
            board = makeTurn(board=board, symbol=player.symbol)
            board = computer.ranTurn(self=computer, board=board)
            board.show(board)
        else:  # Computer First
            board = computer.ranTurn(self=computer, board=board)
            board.show(board)
            board = makeTurn(board=board, symbol=player.symbol)
            board.show(board)
        if i >= 2:
            win = board.checkWin(board)
            print("The Winner is ", win, "!")
            exit()
    print("Stalemate")


# sets main() to run
if __name__ == "__main__":
    main()
