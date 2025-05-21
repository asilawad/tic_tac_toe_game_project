import 'app/service_locator.dart';
import 'business_logic/tic_tac_toe_start.dart';

void main() {
  setupServiceLocator();

  TicTacToe game = getIt<TicTacToe>(); 
  game.startGame();
}
