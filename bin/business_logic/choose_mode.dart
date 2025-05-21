import 'dart:io';

class ChoosingMode {
  bool isVsAI = false;

  void chooseMode() {
    stdout.write("Do you want to play vs AI? (y/n): ");
    String? input = stdin.readLineSync();
    isVsAI = input?.toLowerCase() == 'y';
  }
}
