// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_app/shared_in_app/custom_widgets/sign_out.dart';
import 'package:shop_app/shared_in_app/sharedpref.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              signOut(context);
            },
            child: Text('sign out'),),
            TextButton(
            onPressed: () async{
              await CachHelper.removeCachedDate('onboarding');
            },
            child: Text('remove onboarding'),)
      ],
    ); //kill token
  }
}
