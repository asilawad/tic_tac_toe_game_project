import 'dart:io';

import 'choose_mode.dart';
import 'players_markers.dart';
import 'print_board.dart';

class MovingPlayer {
  final PlayerMarkers _playerMarkers = PlayerMarkers();
  final ChoosingMode _choosingMode = ChoosingMode();
  final PrintingBoard _printingBoard = PrintingBoard();
  int getPlayerMove() {
    if (_choosingMode.isVsAI &&
        _playerMarkers.currentPlayer == _playerMarkers.playerO) {
      return getAIMove(); // AI move
    }

    int move;
    while (true) {
      stdout.write(
          "Player ${_playerMarkers.currentPlayer}, enter your move (1-9): ");
      String? input = stdin.readLineSync();
      if (input == null || int.tryParse(input) == null) {
        print("Invalid input. Please enter a number from 1 to 9.");
        continue;
      }
      move = int.parse(input) - 1;
      if (move < 0 || move > 8) {
        print("Input out of range. Try again.");
      } else if (_printingBoard.board[move] == _playerMarkers.playerX ||
          _printingBoard.board[move] == _playerMarkers.playerO) {
        print("Cell already taken. Choose another one.");
      } else {
        break;
      }
    }
    return move;
  }

  //Get Ai Move

  int getAIMove() {
    // Simple AI: pick the first available cell
    for (int i = 0; i < 9; i++) {
      if (_printingBoard.board[i] != _playerMarkers.playerX &&
          _printingBoard.board[i] != _playerMarkers.playerO) {
        print("AI chose ${i + 1}");
        return i;
      }
    }
    return 0; // Just in case
  }
}
