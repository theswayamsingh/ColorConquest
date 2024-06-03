import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart' as globals;

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.winner,required this.gotohome,required this.playagain});
  final String winner;
  final void Function() gotohome;
  final void Function() playagain;

  @override
  Widget build(context) {
    return Stack(children: [
      winner == (globals.player2.text.isEmpty?'Player-2':globals.player2.text)
      ? Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    'images/stars.png',
                    width: 300,
                  ),
                ),
              ],
            )
          : const Text(''),
      winner == (globals.player1.text.isEmpty?'Player-1':globals.player1.text)
      ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'images/stars.png',
                      width: 300,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            )
          : const Text(''),
      Center(
        child: Container(  // By using centre there is no need to specify height and width.
          // height: 1000,
          // width: 500,
          color: Colors.white.withOpacity(0.5),
          child: Center(
            child: Container(
              width: 270,
              height: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 37, 40, 133),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Material(  // Yellow underline will appear because Scaffold is missing. To overcome you can use Material() or DefaultTextStyle().
                        child: Text(
                          winner,
                          style: GoogleFonts.oswald(
                            color:
                                winner==(globals.player1.text.isEmpty?'Player-1':globals.player1.text)
                                ? Colors.red : Colors.blue,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 5,
                        width: 100,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 85,
                        width: 70,
                        child: Image.asset('images/medal.png'),
                      ),
                      Container(
                        height: 5,
                        width: 100,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  
                  Text(
                    'WINS!',
                    style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  
                  const SizedBox(
                    height: 5,
                  ),
                  OutlinedButton(
                    onPressed: playagain,
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue),
                    child: const Text(
                      '    Play Again    ',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  OutlinedButton(
                    onPressed: gotohome,
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red),
                    child: const Text(
                      '        Home        ',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
