import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key, required this.playGame, required this.rulesScreen});

  final void Function() playGame;
  final void Function() rulesScreen;
  
  @override
  Widget build(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // SizedBox(height: screenHeight * .04),
        Text(
          'COLOR',
          style: GoogleFonts.satisfy(
              color: Colors.black,
              fontSize: screenHeight * .085,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'CONQUEST',
          style: GoogleFonts.satisfy(
              color: Colors.black,
              fontSize: screenHeight * .085,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: screenHeight * .46,
          width: screenWidth * 1,
          child: Image.asset(
            'images/vs.png',
          ),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth * .3,
            ),
            OutlinedButton(
              onPressed: playGame,
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue),
              child: Text(
                'PLAY',
                style: TextStyle(
                    fontSize: screenHeight * .05, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: screenWidth * .04,
            ),
            IconButton(
              icon: SizedBox(
                height: screenHeight * .09,
                width: screenWidth * .2,
                child: Image.asset(
                  'images/question.png',
                ),
              ),
              onPressed: rulesScreen,
            ),
          ],
        ),
        const Expanded(child: SizedBox())
      ],
    );
  }
}
