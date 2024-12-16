// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: constant_identifier_names
enum ToastState { LOADING,SUCSSES, ERROR, WORING }

ChooseToastColor(ToastState state) {
  Color bacgroundColor;
  switch (state) {
    case ToastState.LOADING:
      bacgroundColor = Colors.blue;
      break;
    case ToastState.SUCSSES:
      bacgroundColor = Colors.green;
      break;
    case ToastState.ERROR:
      bacgroundColor = Colors.red;
      break;
    case ToastState.WORING:
      bacgroundColor = Colors.yellow;
      break;
  }
  return bacgroundColor;
}

showToast({var text, ToastState toaststate=ToastState.SUCSSES}) async {
  await Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: ChooseToastColor(toaststate),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
