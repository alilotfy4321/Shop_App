// ignore_for_file: prefer_typing_uninitialized_variables



import 'package:shop_app/core/errors/error_model.dart';

class ServerExeptions implements Exception {
  final ErrorModel  errorModel;
  ServerExeptions({required this.errorModel});
}
