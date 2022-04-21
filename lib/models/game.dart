class Game {
  int userDice = 0;
  int opponentDice = 0;
  int userScore = 0;
  int opponentScore = 0;
  int numberRounds = 0;
  Map<int, List<int>> roundHistory = {
    0: [
      0,
      0,
    ]
  };
}
