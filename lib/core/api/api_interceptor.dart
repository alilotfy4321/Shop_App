import 'package:dio/dio.dart';

import '../../shared_in_app/sharedpref.dart';


class ApiInterceptor extends Interceptor {
  var interceptorResponse;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async {

      String? token = (await CachHelper.getUserCachedValue(key: 'token'));///to identify who are you

    // Add custom headers
    options.headers = 
    {
      "lang": "en",
      "Content-Type":"application/json",
      "Authorization":token??'',
      
      };

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
