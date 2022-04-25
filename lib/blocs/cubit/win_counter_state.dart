part of 'win_counter_cubit.dart';

class WinCounterState extends Equatable {
  final int userWinCounter;
  final int opponentWinCounter;
  WinCounterState({
    required this.userWinCounter,
    required this.opponentWinCounter,
  });
  factory WinCounterState.initial() {
    return WinCounterState(
      userWinCounter: 0,
      opponentWinCounter: 0,
    );
  }
  @override
  List<Object> get props => [userWinCounter, opponentWinCounter];
}
