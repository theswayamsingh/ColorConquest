import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key, required this.homeScreen});
  final void Function() homeScreen;

  @override
  Widget build(context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * .03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: screenHeight * .055,
                    width: screenHeight * .055,
                    child: Image.asset('images/cross.png'),
                  ),
                ),
                onPressed: homeScreen,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.35),
                ),
                child: Scrollbar(
                  thickness: 10,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'How to Play?',
                          style: GoogleFonts.oswald(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: screenHeight * .05,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/0.png')),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/01.png')),
                        Text(
                          "The goal of this game is to occupy as much as boxes and make opponent's score to zero by conquering all the colored boxes occupied by the opponent.",
                          style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: screenHeight * .027,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const Text(''),
                        Text(
                          "The game starts with score equals to 0 for both players.",
                          style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: screenHeight * .027,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/1.png')),
                        Text(
                          "The background color show's which player turn it is. The first turn is always for red color player. The background color changes as the player take their moves.",
                          style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: screenHeight * .027,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const Text(''),
                        Text(
                          "The box gets the color, representing boxes of each player.",
                          style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: screenHeight * .027,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const Text(''),
                        Text(
                          "NOTE : The player can tap only on revealed boxes containing his/her color (e.g. red player can tap only on red boxes, not on blue boxes).",
                          style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: screenHeight * .027,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const Text(''),
                        Text(
                          """The number on box increases as you tap on the boxes. Any box can give you max of 4 points. Revealing un-revealed boxes gives you 3 points.""",
                          style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: screenHeight * .027,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/2.png')),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/3.png')),
                        Text(
                          "Further tapping on 3 numbered box, the box get destroyed and opens one box in each direction (except diagonal) having 1 point each, total giving you 4 points.",
                          style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: screenHeight * .027,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/4.png')),
                        Text(
                          "The score for each player is calculated as the sum of numbers represented by his/her colored boxes.",
                          style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: screenHeight * .027,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          "Continue playing till you occupy as much as boxes, dropping opponent's score to zero.",
                          style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: screenHeight * .027,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/5.png')),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/6.png')),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/7.png')),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/8.png')),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/9.png')),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/10.png')),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/11.png')),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/12.png')),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/13.png')),
                        Text(
                          "Result screen is shown as below :",
                          style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: screenHeight * .027,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                            height: screenHeight * .54,
                            child: Image.asset('images/screenshots/14.png')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
