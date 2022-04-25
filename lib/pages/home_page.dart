import 'package:dice_bloc/constants/dice_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cubit/game_history_cubit.dart';
import '../blocs/cubit/new_round_cubit.dart';
import '../models/game.dart';
import 'round_info_msg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameHistoryCubit, GameHistoryState>(
      listener: (context, state) {
        print('GameHistoryCubit: $state');
      },
      builder: (context, state) {
        return BlocConsumer<NewRoundCubit, NewRoundState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state.roundCounter == 0) {
              BlocProvider.of<GameHistoryCubit>(context).restartGameHistory();
            }
            if (state.roundCounter >
                BlocProvider.of<GameHistoryCubit>(context)
                    .state
                    .roundHistory
                    .length) {
              BlocProvider.of<GameHistoryCubit>(context).addRound(
                state.userDice,
                state.opponentDice,
                state.roundCounter,
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('The Dice Game'),
                actions: [
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: FloatingActionButton(
                      elevation: 20,
                      backgroundColor: Colors.red.withOpacity(0),
                      child: ImageIcon(
                        AssetImage('assets/images/dicelogo.png'),
                        size: 40,
                      ),
                      onPressed: () => print('Game History'),
                    ),
                  )
                ],
              ),
              body: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.red,
                      Colors.orangeAccent,
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.redAccent,
                                Colors.orangeAccent,
                              ],
                            ),
                            border: Border.all(
                              width: 3,
                              color: Colors.redAccent.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50))),
                        child: Column(
                          children: [
                            Center(
                              child: roundInfoMsg(state.roundCounter,
                                  state.userDice, state.opponentDice),
                            ),
                            SizedBox(height: 15),
                            Center(
                              child: Text(
                                'Round Counter: ${state.roundCounter}',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Your Wins:',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${state.userDice}',
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(diceImage['user']![state.userDice],
                                    height: 120, width: 120),
                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
                              children: [
                                Text(
                                  'Bot Wins:',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${state.opponentDice}',
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                    diceImage['bot']![state.opponentDice],
                                    height: 120,
                                    width: 120),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(110),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 170,
                              height: 45,
                              child: ElevatedButton(
                                onPressed:
                                    context.read<NewRoundCubit>().newRoundRoll,
                                child: Text('Start New Round'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent,
                                    side: BorderSide(
                                        color: Colors.orangeAccent, width: 2)),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            SizedBox(
                              width: 170,
                              height: 45,
                              child: ElevatedButton(
                                onPressed:
                                    context.read<NewRoundCubit>().restartGame,
                                child: Text('Restart The Game'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent,
                                    side: BorderSide(
                                        color: Colors.orangeAccent, width: 2)),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            SizedBox(
                              width: 170,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () => {
                                  print(
                                    BlocProvider.of<GameHistoryCubit>(context)
                                        .state
                                        .roundHistory,
                                  ),
                                },
                                child: Text('Show Game History'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent,
                                    side: BorderSide(
                                        color: Colors.orangeAccent, width: 2)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
