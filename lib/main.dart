// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_app/styles/theme.dart';
import 'package:shop_app/view/onBording/onBordingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: null,
      home: OnBoardingScreen(),
    );
  }
}
