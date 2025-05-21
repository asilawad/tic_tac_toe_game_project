import 'package:get_it/get_it.dart';

import '../business_logic/choosing_mode.dart';
import '../business_logic/moving_player.dart';
import '../business_logic/players_markers.dart';
import '../business_logic/playing_game.dart';
import '../business_logic/printing_board.dart';
import '../business_logic/tic_tac_toe_start.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //-------------------------Choosing Mode Object-------------------------

  getIt.registerLazySingleton<ChoosingMode>(() => ChoosingMode());

  //-------------------------Player Markers Object-------------------------

  getIt.registerLazySingleton<PlayerMarkers>(() => PlayerMarkers());

  //-------------------------Printing Board Object-------------------------

  getIt.registerLazySingleton<PrintingBoard>(() => PrintingBoard());

  //-------------------------Moving Player Object-------------------------

  getIt.registerLazySingleton<MovingPlayer>(() => MovingPlayer(
        getIt<PlayerMarkers>(),
        getIt<ChoosingMode>(),
        getIt<PrintingBoard>(),
      ));

  //-------------------------Playing Game Object-------------------------

  getIt.registerLazySingleton<PlayingGame>(() => PlayingGame(
        getIt<PlayerMarkers>(),
        getIt<PrintingBoard>(),
        getIt<MovingPlayer>(),
      ));

  //-------------------------Tic Tac Toe Object-------------------------

  getIt.registerLazySingleton<TicTacToe>(() => TicTacToe(
        getIt<PlayingGame>(),
        getIt<ChoosingMode>(),
        getIt<PlayerMarkers>(),
      ));
}
