import 'dart:math';

class Game {
  int userDice;
  int opponentDice;
  int userScore;
  int opponentScore;
  int numberRounds;
  Game({
    this.userDice = 0,
    this.opponentDice = 0,
    this.userScore = 0,
    this.opponentScore = 0,
    this.numberRounds = 0,
  });

}

class GameHistory extends Game {
  Map<int, List<int>> roundHistory = {
    0: [
      0,
      0,
    ]
  };

  void addRound(int userDice, int opponentDice) {
    numberRounds++;
    roundHistory[numberRounds] = [userDice, opponentDice];
  }
}
