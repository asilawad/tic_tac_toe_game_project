import 'choosing_mode.dart';
import 'players_markers.dart';
import 'playing_game.dart';

class TicTacToe {
// Start the game
  final PlayingGame _playingGame;
  final ChoosingMode _choosingMode;
  final PlayerMarkers _playerMarkers;

  TicTacToe(this._playingGame, this._choosingMode, this._playerMarkers);

  void startGame() {
    _choosingMode.chooseMode();
    _playerMarkers.chooseMarkers();
    _playingGame.playGame();
  }
}
