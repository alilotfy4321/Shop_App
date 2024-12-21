// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/controll/shop_app_register/register_cubit.dart';

class PicprofilePicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopRegisterCubit, ShopAppRegisterStates>(
      listener: (context, state){},
      builder: (context, state) {
        var cubit = ShopRegisterCubit.get(context);

        return Stack(children: [
          // Circular Avatar
          (cubit.profilePic==null)?CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/Capture1.PNG'),
          ):CircleAvatar(
            radius: 60,
            backgroundImage: FileImage(File(cubit.profilePic!.path)),
          ),
          // Camera Icon Button
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.blue,
                size: 30,
              ),
              onPressed: () {
                ImagePicker()
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  cubit.uploadProfilePic(value!);
                });
              },
            ),
          ),
        ]);
      },
    );
  }
}
