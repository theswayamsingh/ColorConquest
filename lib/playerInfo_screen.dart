import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart' as globals;

class PlayerInfoScreen extends StatelessWidget {
  const PlayerInfoScreen(
      {super.key, required this.startGame, required this.homeScreen});
  final void Function() startGame;
  final void Function() homeScreen;

  @override
  Widget build(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  'images/cross.png',
                  width: screenWidth * 0.12,
                ),
              ),
              onPressed: homeScreen,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: screenHeight * .06,
            width: screenWidth * 1,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 246, 167),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 7, color: Colors.black26, spreadRadius: 4),
              ],
            ),
            child: Center(
              child: Text(
                'PLAYER INFORMATION',
                style: GoogleFonts.oswald(
                    color: Colors.black,
                    fontSize: screenHeight * .04,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * .025,
                  ),
                  SizedBox(
                    height: screenHeight * .15,
                    width: screenWidth * .49,
                    child: Image.asset(
                      'images/p1.png',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 63, 65, 104),
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                  ),
                  height: screenHeight * .122,
                  width: screenWidth * .46,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'images/red.png',
                        width: screenWidth * .058,
                      ),
                      SizedBox(
                        width: screenWidth * .38,
                        child: TextField(
                          controller: globals.player1,
                          cursorColor: Colors.white,
                          cursorHeight: 22,
                          maxLength: 10,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2.5,
                              ),
                            ),
                            hintText: 'Enter Player-1 Name',
                            hintStyle: GoogleFonts.lato(
                                color: Colors.white70,
                                fontSize: screenHeight * .017,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: screenHeight * .15,
              width: screenWidth * .49,
              child: Image.asset(
                'images/p2.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 63, 65, 104),
                  borderRadius: BorderRadius.all(
                    Radius.circular(22),
                  ),
                ),
                height: screenHeight * .122,
                width: screenWidth * .46,
                child: Column(
                  children: [
                    Image.asset(
                      'images/blue.png',
                      width: screenWidth * .058,
                    ),
                    SizedBox(
                      width: screenWidth * .38,
                      child: TextField(
                        controller: globals.player2,
                        cursorColor: Colors.white,
                        cursorHeight: 22,
                        maxLength: 10,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.5,
                            ),
                          ),
                          hintText: 'Enter Player-2 Name',
                          hintStyle: GoogleFonts.lato(
                              color: Colors.white70,
                              fontSize: screenHeight * .017,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight * .045,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: screenHeight * .2,
                    width: screenWidth * .42,
                    child: Image.asset(
                      'images/left.png',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * .2,
              width: screenWidth * .44,
              child: Image.asset(
                'images/right.png',
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * .040,
        ),
        OutlinedButton(
          onPressed: startGame,
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue),
          child: Text(
            'START',
            style: TextStyle(
                fontSize: screenHeight * .045, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
