import 'dart:async';

import 'package:flutter/material.dart';
import 'package:color_conquest/game.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());
  runApp(const Game());
}
