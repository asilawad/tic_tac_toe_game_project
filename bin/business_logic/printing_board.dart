class PrintingBoard {
  // 1. Create a 3x3 board consisting of 9 cells
  List<String> board = List.generate(9, (index) => (index + 1).toString());

  void printBoard() {
    print('\n');
    for (int i = 0; i < 9; i += 3) {
      print('${board[i]} | ${board[i + 1]} | ${board[i + 2]}');
      if (i < 6) print('--+---+--');
    }
    print('\n');
  }
}
