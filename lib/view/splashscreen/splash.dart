// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_initializing_formals, must_be_immutable, no_logic_in_create_state

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop_app/shared_in_app/custom_widgets/vhSpace.dart';
import 'package:shop_app/view/onBording/onBordingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState();
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds then navigate to the home screen
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return  OnBoardingScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your splash screen background color
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Text(
                'Go Shoping',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            VSpace(),
            Container(
              width: 300,
              height: 300,
              child: Image(
                image: AssetImage('assets/images/splash2.jpg'),
              ),
            ),
            Spacer(),
            Text(
              'developed by ali lotfy',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
