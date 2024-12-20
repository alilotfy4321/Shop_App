// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, prefer_initializing_formals, use_key_in_widget_constructors, must_be_immutable, unnecessary_null_in_if_null_operators, unnecessary_null_comparison, curly_braces_in_flow_control_structures

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/controll/bloc_observer.dart';
import 'package:shop_app/controll/shop_app_cubit/shop_app_cubit.dart';
import 'package:shop_app/controll/shop_app_register/register_cubit.dart';
import 'package:shop_app/controll/shop_login/shop_login_cubit.dart';
import 'package:shop_app/core/api/dio_consumer.dart';
import 'package:shop_app/shared_in_app/constants/constant.dart';
import 'package:shop_app/shared_in_app/sharedpref.dart';

import 'package:shop_app/shared_in_app/styles/theme.dart';
import 'package:shop_app/view/login/login.dart';
import 'package:shop_app/view/onBording/onBordingScreen.dart';
import 'package:shop_app/view/shop_home_layout/proudcts.dart/products.dart';
import 'package:shop_app/view/shop_home_layout/shop_home_layout.dart';
import 'package:shop_app/view/splashscreen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  bool? isOnboarding = (await CachHelper.getUserCachedValue(key: 'onboarding'));
   token = (await CachHelper.getUserCachedValue(key: 'token'));
  print('isOnboarding =$isOnboarding');
  print('token =$token');
  Widget widget;
  if (isOnboarding !=null) {
    if (token != null) {
      widget = ShopHomeLayout();
    } else {
      widget = LoginPage();
    }
  } else {
    widget = SplashScreen();
  }
  Bloc.observer = MyBlocObserver();
  runApp(
    MyApp(startWidget: widget),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final startWidget;

  const MyApp({required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              ShopLoginCubit(DioConsumer(dio: Dio())),
        ),
          BlocProvider(
          create: (BuildContext context) =>
              ShopRegisterCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              ShopAppCubit(DioConsumer(dio: Dio()))..getHomeData()..getCategoriesData()..getFavoritesItems()..getUserProfile(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,  
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: startWidget,
      ),
    );
  }
}
