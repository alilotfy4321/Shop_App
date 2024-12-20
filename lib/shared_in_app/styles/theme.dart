// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//------------------light theme---------------
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    //backgroundColor: const Color.fromARGB(255, 113, 121, 128),
    elevation: 0.0,
    selectedIconTheme: IconThemeData(
      color: Colors.teal,
      size: 30.0,
      
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
      size: 30.0,
      
    ),
    selectedItemColor: Colors.black,

    selectedLabelStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);
//-----------------dark theme --------------------
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor:const Color.fromARGB(255, 41, 35, 35),
  appBarTheme: const AppBarTheme(
    color: Colors.grey,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.blue,
    ),
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.black,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    elevation: 0.0,
    selectedIconTheme: IconThemeData(
      color: Colors.white,
      size: 30.0,
    ),
    selectedLabelStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);
