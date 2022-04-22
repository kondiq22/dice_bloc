import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/game.dart';

part 'new_round_state.dart';

class NewRoundCubit extends Cubit<NewRoundState> {
  NewRoundCubit()
      : super(NewRoundState(
          0,
          0,
          0,
        ));

  void newRoundRoll() {
    int userDice = Random().nextInt(6) + 1;
    int opponentDice = Random().nextInt(6) + 1;
    int roundCounter = state.roundCounter + 1;
    emit(NewRoundState(
      userDice,
      opponentDice,
      roundCounter,
    ));
  }

  void restartGame() {
    emit(NewRoundState(
      0,
      0,
      0,
    ));
  }
}
