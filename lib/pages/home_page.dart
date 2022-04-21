import 'package:dice_bloc/constants/dice_images.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                      child: Text(
                        'Welcome in the Dice!',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Text(
                        'Round Counter: 0',
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
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '11',
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(diceImage['user']![1],
                            height: 120, width: 120),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Text(
                          'Bot Wins:',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '00',
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(diceImage['bot']![5],
                            height: 120, width: 120),
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
                        onPressed: () => print('Play'),
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
                        onPressed: () => print('Restart'),
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
                        onPressed: () => print('History'),
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
  }
}
