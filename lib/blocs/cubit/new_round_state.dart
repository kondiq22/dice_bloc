part of 'new_round_cubit.dart';

class NewRoundState extends Equatable {
  final int userDice;
  final int opponentDice;
  final int roundCounter;

  NewRoundState(
    this.userDice,
    this.opponentDice,
    this.roundCounter,
  );

  @override
  List<Object?> get props => [userDice, opponentDice, roundCounter];
}
