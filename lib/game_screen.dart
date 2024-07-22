import 'package:flutter/material.dart';
import 'package:color_conquest/result_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart' as globals;

class GameScreen extends StatefulWidget {
  const GameScreen(
      {super.key,
      required this.playersScreen,
      required this.playAgain,
      required this.homeScreen});
  final void Function() playersScreen;
  final void Function() homeScreen;
  final void Function() playAgain;
  @override
  State<GameScreen> createState() {
    return _GameScreen();
  }
}

class _GameScreen extends State<GameScreen> {
  Color mainClr = const Color.fromARGB(255, 250, 88, 76);
  final color1 = const Color.fromARGB(255, 250, 88, 76);
  final color2 = const Color.fromARGB(255, 75, 165, 239);

  var listFor3 = []; // Contains indices for 3.
  var listFor3_2 = []; // Contains indices for Empty.
  var listFor2 = []; // Contains indices for 2.
  var listFor1 = []; // temp list for retrieving indices of 1.
  var listFor1_2 = []; // Contains indices for 1.

  Widget container(boxNum, circleClr) {
    return Container(
      decoration: BoxDecoration(
        color: circleClr,
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Center(
        child: Text(
          boxNum,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: globals.numsize,
          ),
        ),
      ),
    );
  }

  var red = [];
  var blue = [];
  void addind({a, b, c, d}) {
    if (mainClr == color1) {
      for (var z in [a, b, c, d]) {
        if (z != Null && blue.contains(z)) {
          blue.remove(z);
        }
      }
      red.addAll([a, b, c, d]);
    } else if (mainClr == color2) {
      for (var z in [a, b, c, d]) {
        if (z != Null && red.contains(z)) {
          red.remove(z);
        }
      }
      blue.addAll([a, b, c, d]);
    }
  }

  void update(index) {
    if (listFor1_2.contains(index) && listFor2.contains(index) == false) {
      listFor2.add(index);
    } else if (listFor2.contains(index) && listFor3.contains(index) == false) {
      listFor3.add(index);
    } else if (listFor3.contains(index) == false) {
      listFor3.add(index);
    } else if (listFor3.contains(index) &&
        (listFor3_2.contains(index) == false)) {
      listFor3_2.add(index);

      final int p = index + 1;
      final int q = index - 1;
      final int r = index + 5;
      final int s = index - 5;
      if (index == 0) {
        listFor1.addAll([p, r]);
        addind(a: p, b: r);
      } else if (index == 4) {
        listFor1.addAll([q, r]);
        addind(a: q, b: r);
      } else if (index == 20) {
        listFor1.addAll([p, s]);
        addind(a: p, b: s);
      } else if (index == 24) {
        listFor1.addAll([q, s]);
        addind(a: q, b: s);
      } else if ([1, 2, 3].contains(index)) {
        listFor1.addAll([q, p, r]);
        addind(a: q, b: p, c: r);
      } else if ([21, 22, 23].contains(index)) {
        listFor1.addAll([q, p, s]);
        addind(a: q, b: p, c: s);
      } else if ([5, 10, 15].contains(index)) {
        listFor1.addAll([s, p, r]);
        addind(a: s, b: p, c: r);
      } else if ([9, 14, 19].contains(index)) {
        listFor1.addAll([s, q, r]);
        addind(a: s, b: q, c: r);
      } else {
        listFor1.addAll([p, q, r, s]);
        addind(a: p, b: q, c: r, d: s);
      }

      for (int x in [p, q, r, s]) {
        if (listFor3.contains(x)) {
          if (listFor3_2.contains(x) == false) {
            listFor3_2.add(x);
            if (x == 0) {
              listFor1_2.addAll([x + 1, x + 5]);
              addind(a: x + 1, b: x + 5);
            } else if (x == 4) {
              listFor1_2.addAll([x - 1, x + 5]);
              addind(a: x - 1, b: x + 5);
            } else if (x == 20) {
              listFor1_2.addAll([x + 1, x - 5]);
              addind(a: x + 1, b: x - 5);
            } else if (x == 24) {
              listFor1_2.addAll([x - 1, x - 5]);
              addind(a: x - 1, b: x - 5);
            } else if ([1, 2, 3].contains(x)) {
              listFor1_2.addAll([x - 1, x + 1, x + 5]);
              addind(a: x - 1, b: x + 1, c: x + 5);
            } else if ([21, 22, 23].contains(x)) {
              listFor1_2.addAll([x - 1, x + 1, x - 5]);
              addind(a: x - 1, b: x + 1, c: x - 5);
            } else if ([5, 10, 15].contains(x)) {
              listFor1_2.addAll([x - 5, x + 1, x + 5]);
              addind(a: x - 5, b: x + 1, c: x + 5);
            } else if ([9, 14, 19].contains(x)) {
              listFor1_2.addAll([x - 5, x - 1, x + 5]);
              addind(a: x - 5, b: x - 1, c: x + 5);
            } else {
              listFor1_2.addAll([x + 1, x - 1, x + 5, x - 5]);
              addind(a: x + 1, b: x - 1, c: x + 5, d: x - 5);
            }
          }
        }
      }

      for (int i in listFor1) {
        if (listFor1_2.contains(i) == false) {
          listFor1_2.add(i);
        } else if (listFor2.contains(i) == false) {
          listFor2.add(i);
        } else if (listFor2.contains(i) && listFor3.contains(i) == false) {
          listFor3.add(i);
        } else if (listFor3.contains(i) && listFor3_2.contains(i) == false) {
          listFor3_2.add(i);

          if (i == 0) {
            listFor1_2.addAll([i + 1, i + 5]);
            addind(a: i + 1, b: i + 5);
          } else if (i == 4) {
            listFor1_2.addAll([i - 1, i + 5]);
            addind(a: i - 1, b: i + 5);
          } else if (i == 20) {
            listFor1_2.addAll([i + 1, i - 5]);
            addind(a: i + 1, b: i - 5);
          } else if (i == 24) {
            listFor1_2.addAll([i - 1, i - 5]);
            addind(a: i - 1, b: i - 5);
          } else if ([1, 2, 3].contains(i)) {
            listFor1_2.addAll([i - 1, i + 1, i + 5]);
            addind(a: i - 1, b: i + 1, c: i + 5);
          } else if ([21, 22, 23].contains(i)) {
            listFor1_2.addAll([i - 1, i + 1, i - 5]);
            addind(a: i - 1, b: i + 1, c: i - 5);
          } else if ([5, 10, 15].contains(i)) {
            listFor1_2.addAll([i - 5, i + 1, i + 5]);
            addind(a: i - 5, b: i + 1, c: i + 5);
          } else if ([9, 14, 19].contains(i)) {
            listFor1_2.addAll([i - 5, i - 1, i + 5]);
            addind(a: i - 5, b: i - 1, c: i + 5);
          } else {
            listFor1_2.addAll([i + 1, i - 1, i + 5, i - 5]);
            addind(a: i + 1, b: i - 1, c: i + 5, d: i - 5);
          }
        }
      }
      listFor1.clear();
    }
  }

  int redScore = 0;
  int blueScore = 0;
  String gamewinner =
      globals.player1.text.isEmpty ? 'Player-1' : globals.player1.text;
  bool wincondition = false;

  void score() {
    redScore = 0;
    blueScore = 0;
    for (int i in listFor1_2) {
      if (listFor2.contains(i) == false &&
          listFor3.contains(i) == false &&
          listFor3.contains(i) == false) {
        if (red.contains(i)) {
          redScore += 1;
        } else if (blue.contains(i)) {
          blueScore += 1;
        }
      }
    }
    for (int i in listFor2) {
      if (listFor3.contains(i) == false && listFor3_2.contains(i) == false) {
        if (red.contains(i)) {
          redScore += 2;
        } else if (blue.contains(i)) {
          blueScore += 2;
        }
      }
    }
    for (int i in listFor3) {
      if (listFor3_2.contains(i) == false) {
        if (red.contains(i)) {
          redScore += 3;
        } else if (blue.contains(i)) {
          blueScore += 3;
        }
      }
    }

    wincondition = (redScore == 0 && blueScore != 0) ||
        (blueScore == 0 && redScore != 0 && listFor3.length > 1);
    if (wincondition) {
      if (redScore != 0) {
      } else {
        gamewinner =
            globals.player2.text.isEmpty ? 'Player-2' : globals.player2.text;
      }
    }
  }

  String num(index) {
    String val = '';
    if (listFor2.contains(index) && listFor3.contains(index) == false) {
      val = '2';
    } else if (listFor3.contains(index) &&
        (listFor3_2.contains(index) == false)) {
      val = '3';
    } else if (listFor3.contains(index) && listFor3_2.contains(index)) {
      val = '';
    } else if (listFor1_2.contains(index) &&
        listFor3.contains(index) == false &&
        listFor2.contains(index) == false) {
      val = '1';
    } else if (listFor2.contains(index)) {
      val = '2';
    }
    return val;
  }

  Color circleColor(index) {
    Color val = const Color.fromARGB(255, 189, 189, 189);
    if (listFor3.contains(index) && (listFor3_2.contains(index) == false)) {
      if (red.contains(index)) {
        val = color1;
      } else if (blue.contains(index)) {
        val = color2;
      }
    } else if (listFor3.contains(index) && listFor3_2.contains(index)) {
      val = Colors.white;
    }
    if (listFor1_2.contains(index) && listFor3.contains(index) == false) {
      if (red.contains(index)) {
        val = color1;
      } else if (blue.contains(index)) {
        val = color2;
      }
    }
    return val;
  }

  Color boxColor(index) {
    if (listFor3.contains(index) || listFor1_2.contains(index)) {
      return Colors.white;
    } else {
      return const Color.fromARGB(255, 189, 189, 189);
    }
  }

  @override
  Widget build(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    globals.numsize = screenHeight * .05;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Scaffold(
            backgroundColor: mainClr,
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: SizedBox(
                          child: Image.asset(
                            'images/cross.png',
                            width: screenWidth * 0.12,
                          ),
                        ),
                      ),
                      onPressed: widget.playersScreen,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                        ),
                      ),
                      height: screenHeight * .08,
                      width: screenWidth * .2,
                      child: Center(
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Text(
                            '$blueScore',
                            style: GoogleFonts.lato(
                              color: color2,
                              fontSize: screenHeight * .04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        height: screenHeight * .08,
                        width: screenWidth * .5,
                        child: Center(
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Text(
                              globals.player2.text.isEmpty
                                  ? 'Player-2'
                                  : globals.player2.text,
                              style: GoogleFonts.lato(
                                color: color2,
                                fontSize: screenHeight * .035,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
                SizedBox(
                  height: screenHeight * .06,
                ),
                GridView.builder(
                  padding: const EdgeInsets.all(25.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 25,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (mainClr == color1 &&
                            blue.contains(index) == false &&
                            red.contains(index) == false) {
                          red.add(index);
                        } else if (mainClr == color2 &&
                            red.contains(index) == false &&
                            blue.contains(index) == false) {
                          blue.add(index);
                        }
                        if ((mainClr == color1 && red.contains(index)) ||
                            (mainClr == color2 && blue.contains(index))) {
                          update(index);
                          score();
                          if (mainClr == color1) {
                            mainClr = color2;
                          } else {
                            mainClr = color1;
                          }
                        }
                        if (wincondition) {
                          if (gamewinner == globals.player1.text) {
                            mainClr = color1;
                          } else {
                            mainClr = color2;
                          }
                        }
                      });
                    },
                    child: Card(
                      color: boxColor(index),
                      child: container(num(index), circleColor(index)),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * .06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          ),
                        ),
                        height: screenHeight * .08,
                        width: screenWidth * .5,
                        child: Center(
                          child: Text(
                            globals.player1.text.isEmpty
                                ? 'Player-1'
                                : globals.player1.text,
                            style: GoogleFonts.lato(
                              color: color1,
                              fontSize: screenHeight * .035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0),
                        ),
                      ),
                      height: screenHeight * .08,
                      width: screenWidth * .2,
                      child: Center(
                        child: Text(
                          '$redScore',
                          style: GoogleFonts.lato(
                            color: color1,
                            fontSize: screenHeight * .04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          wincondition
              ? ResultScreen(
                  winner: gamewinner,
                  gotohome: widget.homeScreen,
                  playagain: widget.playAgain,
                )
              : const Text(''),
        ],
      ),
    );
  }
}
