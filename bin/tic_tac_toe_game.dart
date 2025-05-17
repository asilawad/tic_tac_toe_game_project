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
}

void main() {
  TicTacToe game = TicTacToe();
  game.startGame();
}
