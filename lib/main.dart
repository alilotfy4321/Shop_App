// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, prefer_initializing_formals, use_key_in_widget_constructors, must_be_immutable, unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/controll/bloc_observer.dart';
import 'package:shop_app/shared_in_app/sharedpref.dart';

import 'package:shop_app/shared_in_app/styles/theme.dart';
import 'package:shop_app/view/onBording/onBordingScreen.dart';
import 'package:shop_app/view/splashscreen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  bool isOnboarding = await CachHelper.getUserCachedValue(key: 'onboarding');
   print('isOnboarding =$isOnboarding');
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(isOnboarding));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 final bool isOnboarding;

 MyApp(this.isOnboarding);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: SplashScreen(isOnboarding),
    );
  }
}
