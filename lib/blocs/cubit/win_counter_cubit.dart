import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'win_counter_state.dart';

class WinCounterCubit extends Cubit<WinCounterState> {
  WinCounterCubit() : super(WinCounterState.initial());

  void addPoint(int userDice, int opponentDice) {
    int userWinCounter = state.userWinCounter;
    int opponentWinCounter = state.opponentWinCounter;
    if (userDice > opponentDice) {
      userWinCounter++;
    } else if (userDice < opponentDice) {
      opponentWinCounter++;
    }
    emit(WinCounterState(
      userWinCounter: userWinCounter,
      opponentWinCounter: opponentWinCounter,
    ));
  }

  void restartGame() {
    emit(WinCounterState.initial());
  }
}
