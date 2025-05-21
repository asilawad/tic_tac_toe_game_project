import 'dart:io';

class PlayerMarkers {
  String playerX = 'X';
  String playerO = 'O';
  String currentPlayer = 'X'; // Current player

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
