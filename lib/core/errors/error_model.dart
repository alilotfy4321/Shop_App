// ignore_for_file: empty_constructor_bodies

import 'package:shop_app/core/api/endPoints.dart';

class ErrorModel {
  //--------this parameters depends on what parameters is returned by backEnd---
  final int status;
  final String errorMessage;
  final String data;

  ErrorModel({required this.status, required this.errorMessage,required this.data});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    //------- ststus and ErrorMessage  ---must equal in api parameters
    return ErrorModel(
        status: jsonData[AppKeys.statusCode],
        errorMessage: jsonData[AppKeys.errorMessage],
        data:jsonData[AppKeys.data],
        );
  }
}
