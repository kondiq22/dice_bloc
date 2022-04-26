import 'package:flutter/material.dart';

Widget roundInfoMsg(int roundCounter, int userDice, opponentDice) {
  if (roundCounter == 0) {
    return Text('Welcome in the Dice!',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ));
  } else if (userDice > opponentDice)
    return Text('Win!',
        style: TextStyle(
          color: Colors.green,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ));
  else if (userDice < opponentDice)
    return Text('Lost!',
        style: TextStyle(
          color: Color.fromARGB(255, 255, 0, 0),
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ));
  return Text('Draw!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ));
}
