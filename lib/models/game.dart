import 'dart:math';

class Game {
  int userDice;
  int opponentDice;
  int userScore;
  int opponentScore;
  int roundCounter;

  Game({
    this.userDice = 0,
    this.opponentDice = 0,
    this.userScore = 0,
    this.opponentScore = 0,
    this.roundCounter = 0,
  });
}

class RoundHistory {
  Map<int, List<int>> roundHistory = {
    // 0: [
    //   0,
    //   0,
    // ]
  };
}
