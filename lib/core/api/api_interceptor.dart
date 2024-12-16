import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
   var interceptorResponse;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add custom headers
    options.headers["lang"] = "en";

    // Call the next handler
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    interceptorResponse = response.data;
    print('response api iterceptor =$interceptorResponse');
    super.onResponse(response, handler);
  }
}
