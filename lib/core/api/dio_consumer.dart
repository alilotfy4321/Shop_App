// ignore_for_file: unused_local_variable, avoid_print

import 'package:dio/dio.dart';
import 'package:shop_app/core/api/api_comsumer.dart';
import 'package:shop_app/core/api/api_interceptor.dart';
import 'package:shop_app/core/errors/error_model.dart';
import 'package:shop_app/core/errors/exeptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    //-----but base url once in project
    dio.options.baseUrl = 'http://student.valuxapps.com/api/';
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      responseBody: true,
    ));
  }
  //-----------path make it the (end point only)----
  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = false}) async {
    try {
      final respose = await dio.delete(
        path,
        data: (isFormData) ? FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );

      print(respose.data);
    } on DioException catch (e) {
      handelDioExeptions(e);
    }
  }

  @override
  Future get(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = false}) async {
    try {
      final respose = await dio.get(
        path,
        data: data,
        queryParameters: queryParameter,
      );

      print(respose.data);
    } on DioException catch (e) {
      handelDioExeptions(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = false}) async {
    try {
      final respose = await dio.patch(
        path,
        data: (isFormData) ? FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );

      print(respose.data);
    } on DioException catch (e) {
      handelDioExeptions(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = false}) async {
    try {
      final respose = await dio.post(
        path,
        data: (isFormData) ? FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );

    //  print(respose.data);
    } on DioException catch (e) {
      handelDioExeptions(e);
    }
  }

  void handelDioExeptions(DioException e) {
    switch (e.type) {
      //--------- the 7 cases the dio cant connect database----
      case DioExceptionType.connectionTimeout:
        throw ServerExeptions(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.sendTimeout:
        throw ServerExeptions(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
        throw ServerExeptions(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badCertificate:
        throw ServerExeptions(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.cancel:
        throw ServerExeptions(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionError:
        throw ServerExeptions(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.unknown:
        throw ServerExeptions(
            errorModel: ErrorModel.fromJson(e.response!.data));

      //----------------------connect to database but exeption happend
      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400: //bad request
            throw ServerExeptions(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 401: //unauthorized
            throw ServerExeptions(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 403: //foerbiden
            throw ServerExeptions(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 404: //not found
            throw ServerExeptions(
                errorModel: ErrorModel.fromJson(e.response!.data));
        }
    }
  }
}
