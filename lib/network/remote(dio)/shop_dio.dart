// ignore_for_file: unnecessary_null_comparison

import 'package:dio/dio.dart';

import 'package:shop_app/network/remote(dio)/endPoints.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'ar',
        },
      ),
    );
    if (dio != null) {
      print('connection done !');
    } else {
      print('failed connection');
    }
  }

  static Future<Response> getData(String path, {var query, var data}) async {
    return await dio.get(
      path,
      queryParameters: query,
      data: data,
    );
  }

//---------equal insert into in sql------------inset into table (login) values(email:ali,password:123).
  static Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
    var query,
  }) async {
    return await dio.post(
      path,
      data: data,
      queryParameters: query,
    );
  }
}
