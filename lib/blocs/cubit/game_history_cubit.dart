import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_history_state.dart';

class GameHistoryCubit extends Cubit<GameHistoryState> {
  GameHistoryCubit() : super(GameHistoryState.initial());

  void addRound(userDice, opponentDice, roundCounter) {
    final Map<int, List<int>> roundHistory = state.roundHistory;
    roundHistory[roundCounter] = [userDice, opponentDice];
    emit(GameHistoryState(roundHistory: roundHistory));
  }

  void restartGameHistory() {
    emit(GameHistoryState.initial());
  }
}
