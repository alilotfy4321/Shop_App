// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShopHomeLayout extends StatelessWidget {
  const ShopHomeLayout({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home layout',),),
      body: TextButton(onPressed: (){
        
      }, child: Text('Sign out'),),
    );
  }
}