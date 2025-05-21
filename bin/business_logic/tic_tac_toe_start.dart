import 'choosing_mode.dart';
import 'players_markers.dart';
import 'playing_game.dart';

class TicTacToe {
// Start the game
  final PlayingGame _playingGame = PlayingGame();
  final ChoosingMode _choosingMode = ChoosingMode();
  final PlayerMarkers _playerMarkers = PlayerMarkers();

  void startGame() {
    print("Welcome to Tic-Tac-Toe!");
    _choosingMode.chooseMode();
    _playerMarkers.chooseMarkers();
    _playingGame.playGame();
  }
}
