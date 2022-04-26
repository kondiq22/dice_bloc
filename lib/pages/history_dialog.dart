import 'package:flutter/material.dart';

class HistoryDialog {
  Widget showRoundHistory(context, Map<int, List<int>> gameHistory) {
    gameHistory.containsKey(0)
        ? gameHistory.clear()
        : showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                backgroundColor: Colors.black45,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage('assets/images/dicelogo.png'),
                            size: 40,
                            color: Colors.white70,
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          Text(
                            'Round History: ',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          ImageIcon(
                            AssetImage('assets/images/dicelogo.png'),
                            size: 40,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      if (gameHistory.isEmpty)
                        Column(
                          children: [
                            Text(
                              'Game history is empty.',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 25),
                            ),
                            Padding(padding: EdgeInsets.all(10))
                          ],
                        )
                      else
                        for (var k in gameHistory.keys)
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              width: 230,
                              height: 25,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10)),
                                      ),
                                      child: SizedBox(
                                        width: 70,
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            'Round ' + k.toString() + ':',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(4)),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          color: Colors.deepOrangeAccent,
                                        ),
                                        child: Text(
                                          gameHistory[k]![0].toString() +
                                              ' : ' +
                                              gameHistory[k]![1].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(4)),
                                    historyDrawer(
                                        gameHistory[k]![0], gameHistory[k]![1])
                                  ],
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              );
            },
          );
    return Text('error');
  }

  Widget historyDrawer(op, us) {
    return SizedBox(
        width: 70,
        height: 25,
        child: (() {
          if (op > us) {
            return Container(
                padding: EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    'Lose.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ));
          }
          if (op < us) {
            return Container(
                padding: EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    'Win.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ));
          } else {
            return Container(
                padding: EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    'Draw.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ));
          }
        }()));
  }
}
