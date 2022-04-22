part of 'game_history_cubit.dart';

class GameHistoryState extends Equatable {
  final Map<int, List<int>> roundHistory;

  GameHistoryState({required this.roundHistory});

  factory GameHistoryState.initial() {
    return GameHistoryState(
      roundHistory: {},
    );
  }

  @override
  List<Object?> get props => [
        roundHistory,
      ];
}
