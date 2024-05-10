// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, prefer_initializing_formals, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/network/local(sharedPref)/sharedpref.dart';

import 'package:shop_app/network/remote(dio)/shop_dio.dart';
import 'package:shop_app/styles/theme.dart';
import 'package:shop_app/view/onBording/onBordingScreen.dart';
import 'package:shop_app/view/splashscreen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachHelper.init();
  bool isOnboarding = CachHelper.getUserValue(key: 'onboarding');
  print('isOnboarding =$isOnboarding');
  runApp(MyApp(isOnboarding));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool prefisOnboarding = false;

  MyApp(this.prefisOnboarding);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: SplashScreen(prefisOnboarding),
    );
  }
}
