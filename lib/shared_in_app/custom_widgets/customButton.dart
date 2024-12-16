// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

dynamic child;
Widget CustomButton({
  @required child,
  double height = 40,
  double width = 40,
  double radius = 20,
  var color,
  required VoidCallback function,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: ElevatedButton(
      onPressed: function,
      child: child,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        //primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    ),
  );
}
