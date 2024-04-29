// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget CustomTextFormField({
  // ignore: prefer_const_constructors
  IconData prefixicon = Icons.phone,
  suffixIcon,
  double height = 40.0,
  double width = 300,
  double r = 15.0,
  String hint = 'Enter your phone',
  String label = 'phone',
  required TextEditingController controller,
  dynamic function,
  bool isLight = true,
  bool ispasswordLock = false,
  var keyboardType,
}) {
  return Container(
    width: 300,
    child: TextFormField(
      keyboardType: keyboardType,
      obscureText: ispasswordLock,
      controller: controller,
      onChanged: function,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.black,
          // color: isLight ? Colors.black : Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
          // color: isLight ? Colors.black : Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(r),
          ),
        ),
        prefixIcon: Icon(
          prefixicon,
          color: Colors.black,
          // color: isLight ? Colors.black : Colors.white,
        ),
        suffixIcon: suffixIcon,
        hintText: hint,
        labelText: label,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'fill this field';
        }
        return null;
      },
    ),
  );
}
