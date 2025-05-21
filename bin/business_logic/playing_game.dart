import 'dart:io';

import 'choosing_mode.dart';
import 'players_markers.dart';
import 'moving_player.dart';
import 'printing_board.dart';

class PlayingGame {
  final PlayerMarkers _playerMarkers;
  final PrintingBoard _printingBoard;
  final MovingPlayer _movingPlayer;

  PlayingGame(this._playerMarkers, this._printingBoard, this._movingPlayer);
  
  void playGame() {
    while (true) {
      _printingBoard.printBoard(); // Display the board after each move
      int move = _movingPlayer.getPlayerMove(); // Get player move
      makeMove(move); // Apply the move to the board
      if (checkWin()) {
        _printingBoard.printBoard();
        print("Player ${_playerMarkers.currentPlayer} wins!");
        break;
      }
      if (checkDraw()) {
        _printingBoard.printBoard();
        print("It's a draw!");
        break;
      }
      switchPlayer(); // Switch turns between players
    }
    askRestart(); // Restart prompt
  }

  void makeMove(int index) {
    _printingBoard.board[index] = _playerMarkers.currentPlayer;
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
      if (_printingBoard.board[pos[0]] == _playerMarkers.currentPlayer &&
          _printingBoard.board[pos[1]] == _playerMarkers.currentPlayer &&
          _printingBoard.board[pos[2]] == _playerMarkers.currentPlayer) {
        return true;
      }
    }
    return false;
  }

  bool checkDraw() {
    return _printingBoard.board.every((cell) =>
        cell == _playerMarkers.playerX || cell == _playerMarkers.playerO);
  }

  void switchPlayer() {
    _playerMarkers.currentPlayer =
        (_playerMarkers.currentPlayer == _playerMarkers.playerX)
            ? _playerMarkers.playerO
            : _playerMarkers.playerX;
  }

  void askRestart() {
    stdout.write("Do you want to play again? (y/n): ");
    String? answer = stdin.readLineSync();
    if (answer != null && answer.toLowerCase() == 'y') {
      _printingBoard.board =
          List.generate(9, (index) => (index + 1).toString());
      _playerMarkers.currentPlayer = _playerMarkers.playerX;
      playGame();
    } else {
      print("Thanks for playing!");
    }
  }
}
