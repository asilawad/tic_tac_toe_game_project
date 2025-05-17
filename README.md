A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.
# Tic-Tac-Toe Console Game in Dart

A simple console-based Tic-Tac-Toe game built with Dart. This project was developed as part of a Dart assessment to demonstrate proficiency in core programming concepts including control flow, user input handling, validation, and object-oriented design.

---

## Features

- 3x3 dynamic game board.
- Two-player mode (Player vs Player).
- Option to play against a basic AI opponent.
- Player marker selection (X or O).
- Input validation for correct range and empty cells.
- Win condition detection (rows, columns, diagonals).
- Draw condition check.
- Option to restart the game after each round.
- Well-structured code using classes and functions.
- Code documentation with in-line comments.

---

## Getting Started

### Prerequisites

- Install Dart SDK: [https://dart.dev/get-dart](https://dart.dev/get-dart)

You can verify the installation using:
```bash
dart --version


---

Running the Game

1. Clone or download this repository.


2. Navigate to the project directory.


3. Run the game using:



dart run tic_tac_toe.dart

OR (if your Dart version uses direct execution):

dart tic_tac_toe.dart


---

How to Play

The game will ask whether you want to play against the AI or another player.

Then, you’ll choose your marker ('X' or 'O').

Players take turns entering a number from 1 to 9 to place their marker on the board.

The board updates after each move.

The game ends when one player wins or all cells are filled (draw).

After the game ends, you'll be prompted whether to restart or exit.



---

Example Output

Welcome to Tic-Tac-Toe!
Do you want to play vs AI? (y/n): n
Player 1, choose your marker (X or O): X

1 | 2 | 3
--+---+--
4 | 5 | 6
--+---+--
7 | 8 | 9

Player X, enter your move (1-9): 5
...

Player X wins!
Do you want to play again? (y/n): n
Thanks for playing!


---

File Structure

tic_tac_toe.dart     # Main source code
README.md            # Instructions and project info


---

Bonus Features

Basic AI: A simple AI that picks the first available move.

Marker Selection: Choose your symbol at the start of the game.



---

Author

asil awad
May 2025


---

License

This project is open-source and free to use under the MIT License.

---