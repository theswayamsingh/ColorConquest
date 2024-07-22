import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:color_conquest/home_screen.dart';
import 'package:color_conquest/game_screen.dart';
import 'package:color_conquest/playerInfo_screen.dart';
import 'package:color_conquest/game_rules_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Game extends StatefulWidget {
  const Game({super.key});
  @override
  State<Game> createState() {
    return _Game();
  }
}

class _Game extends State<Game> {
  var activeScreen = 'home-screen';
  void switchtoPlayersScreen() {
    setState(() {
      activeScreen = 'player-info-screen';
    });
  }

  void switchtoGameScreen() {
    setState(() {
      activeScreen = 'game-screen';
    });
  }

  void switchtoHomeScreen() {
    setState(() {
      activeScreen = 'home-screen';
    });
  }

  void switchtoRulesScreen() {
    setState(() {
      activeScreen = 'rules-screen';
    });
  }
  
  BannerAd bAd1 = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-4909206634233478/5829588048',
      listener: BannerAdListener(
      //   onAdLoaded: (Ad ad) {
      //   print('Ad loaded');
      // }, 
      //   onAdFailedToLoad: (Ad ad, LoadAdError error) {
      //   log(error.toString());
      //   ad.dispose();
      // },
      ),
      request: const AdRequest());

  BannerAd bAd2 = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-4909206634233478/5096152962',
      listener: BannerAdListener(
      //   onAdLoaded: (Ad ad) {
      //   print('Ad loaded');
      // }, 
      //   onAdFailedToLoad: (Ad ad, LoadAdError error) {
      //   log(error.toString());
      //   ad.dispose();
      // },
      ),
      request: const AdRequest());

  @override
  Widget build(context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Widget screenWidget = HomeScreen(
      playGame: switchtoPlayersScreen,
      rulesScreen: switchtoRulesScreen,
    );
    if (activeScreen == 'player-info-screen') {
      screenWidget = PlayerInfoScreen(
          startGame: switchtoGameScreen, homeScreen: switchtoHomeScreen);
    }
    if (activeScreen == 'game-screen') {
      screenWidget = GameScreen(
          playersScreen: switchtoPlayersScreen,
          playAgain: switchtoPlayersScreen,
          homeScreen: switchtoHomeScreen);
    }
    if (activeScreen == 'home-screen') {
      screenWidget = HomeScreen(
          playGame: switchtoPlayersScreen, rulesScreen: switchtoRulesScreen);
    }
    if (activeScreen == 'rules-screen') {
      screenWidget = RulesScreen(homeScreen: switchtoHomeScreen);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: SizedBox(
              height: screenHeight*.06,
              child: AdWidget(
                ad: bAd1..load(),
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 236, 64),
                  Color.fromARGB(255, 255, 42, 0)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget,
          ),
          bottomNavigationBar: SizedBox(
            height: screenHeight*.06,
            child: AdWidget(
              ad: bAd2..load(),
            ),
          ),
        ),
      ),
    );
  }
}
