import 'dart:io';

class TicTacToe {
  // 1. Create a 3x3 board consisting of 9 cells
  List<String> board = List.generate(9, (index) => (index + 1).toString());
  String currentPlayer = 'X'; // Current player
  String playerX = 'X';
  String playerO = 'O';
  bool isVsAI = false;

  // Start the game
  void startGame() {
    print("Welcome to Tic-Tac-Toe!");
    chooseMode();
    chooseMarkers();
    playGame();
  }

  void playGame() {
    while (true) {
      printBoard(); // Display the board after each move
      int move = getPlayerMove(); // Get player move
      makeMove(move); // Apply the move to the board
      if (checkWin()) {
        printBoard();
        print("Player $currentPlayer wins!");
        break;
      }
      if (checkDraw()) {
        printBoard();
        print("It's a draw!");
        break;
      }
      switchPlayer(); // Switch turns between players
    }
    askRestart(); // Restart prompt
  }

  void printBoard() {
    print('\n');
    for (int i = 0; i < 9; i += 3) {
      print('${board[i]} | ${board[i + 1]} | ${board[i + 2]}');
      if (i < 6) print('--+---+--');
    }
    print('\n');
  }

  void chooseMode() {
    stdout.write("Do you want to play vs AI? (y/n): ");
    String? input = stdin.readLineSync();
    isVsAI = input?.toLowerCase() == 'y';
  }

  void chooseMarkers() {
    stdout.write("Player 1, choose your marker (X or O): ");
    String? marker = stdin.readLineSync();
    if (marker != null &&
        (marker.toUpperCase() == 'X' || marker.toUpperCase() == 'O')) {
      playerX = marker.toUpperCase();
      playerO = (playerX == 'X') ? 'O' : 'X';
      currentPlayer = playerX;
    } else {
      print("Invalid input, defaulting to X vs O.");
    }
  }

  int getPlayerMove() {
    if (isVsAI && currentPlayer == playerO) {
      return getAIMove(); // AI move
    }

    int move;
    while (true) {
      stdout.write("Player $currentPlayer, enter your move (1-9): ");
      String? input = stdin.readLineSync();
      if (input == null || int.tryParse(input) == null) {
        print("Invalid input. Please enter a number from 1 to 9.");
        continue;
      }
      move = int.parse(input) - 1;
      if (move < 0 || move > 8) {
        print("Input out of range. Try again.");
      } else if (board[move] == playerX || board[move] == playerO) {
        print("Cell already taken. Choose another one.");
      } else {
        break;
      }
    }
    return move;
  }

  void makeMove(int index) {
    board[index] = currentPlayer;
  }

  bool checkWin() {
    List<List<int>> winPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pos in winPositions) {
      if (board[pos[0]] == currentPlayer &&
          board[pos[1]] == currentPlayer &&
          board[pos[2]] == currentPlayer) {
        return true;
      }
    }
    return false;
  }

  bool checkDraw() {
    return board.every((cell) => cell == playerX || cell == playerO);
  }

  void switchPlayer() {
    currentPlayer = (currentPlayer == playerX) ? playerO : playerX;
  }

  void askRestart() {
    stdout.write("Do you want to play again? (y/n): ");
    String? answer = stdin.readLineSync();
    if (answer != null && answer.toLowerCase() == 'y') {
      board = List.generate(9, (index) => (index + 1).toString());
      currentPlayer = playerX;
      playGame();
    } else {
      print("Thanks for playing!");
    }
  }

  int getAIMove() {
    // Simple AI: pick the first available cell
    for (int i = 0; i < 9; i++) {
      if (board[i] != playerX && board[i] != playerO) {
        print("AI chose ${i + 1}");
        return i;
      }
    }
    return 0; // Just in case
  }
}

void main() {
  TicTacToe game = TicTacToe();
  game.startGame();
}
